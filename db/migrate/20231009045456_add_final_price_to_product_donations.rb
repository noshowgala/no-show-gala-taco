class AddFinalPriceToProductDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :products_donations, :final_price, :integer
  end
end
