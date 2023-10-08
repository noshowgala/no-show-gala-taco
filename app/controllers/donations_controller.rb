class DonationsController < ApplicationController
  require 'stripe'
  protect_from_forgery except: [:add_product, :remove_product, :checkout]

  def add_product
    donation = current_donation
    product_donation = ProductDonation.create(donation_id: donation.id, product_id: params[:product_id])

    if product_donation.save
      render json: { success: true, donation_count: donation.products_donations.count }
    else
      render json: { success: false, error: product_donation.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def remove_product
    donation = current_donation
    product_donation = ProductDonation.find_by(donation_id: donation.id, product_id: params[:product_id])

    if product_donation&.destroy
      render json: { success: true, donation_count: donation.products_donations.count }
    else
      render json: { success: false, error: "Product donation not found or could not be destroyed" }, status: :unprocessable_entity
    end
  end

  def checkout
    donation = Donation.find_by(id: session[:donation_id])
    return render json: { error: 'Donation not found' }, status: :not_found unless donation

    total_amount = donation.products.sum(:price) * 100

    donation.update(amount: total_amount/100)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'No Show Gala',
            description: 'Thank you for NOT attending our gala!'
          },
          unit_amount: total_amount,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: donations_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: products_url,
      metadata: {
        donation_id: donation.id
      }
    )

    render json: { id: session.id }
  end

  def success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])

    customer_name = session.customer_details.name
    customer_email = session.customer_details.email

    transaction_id = session.payment_intent

    if !StripeTransaction.find_by(stripe_id: transaction_id, customer_name: customer_name,
        customer_email: customer_email)
      stripe_transaction = StripeTransaction.create(stripe_id: transaction_id,
                                                    customer_name: customer_name,
                                                    customer_email: customer_email)

      donation = Donation.find_by(id: session.metadata['donation_id'])
      donation.update(stripe_transaction_id: stripe_transaction.id)
    end
  end


  private

  def current_donation
    donation = Donation.find_by(id: session[:donation_id]) || Donation.create
    session[:donation_id] = donation.id
    donation
  end
end
