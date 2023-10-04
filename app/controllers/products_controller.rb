class ProductsController < ApplicationController
  before_action :reset_donation, only: [:index]

  def index
    @products = Product.all
  end

  private

  def reset_donation
    session.delete(:donation_id) if session[:donation_id]
  end
end
