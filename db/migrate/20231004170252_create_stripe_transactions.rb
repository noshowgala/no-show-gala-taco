class CreateStripeTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :stripe_transactions do |t|
      t.string :stripe_id
      t.string :customer_name
      t.string :customer_email

      t.timestamps
    end
  end
end
