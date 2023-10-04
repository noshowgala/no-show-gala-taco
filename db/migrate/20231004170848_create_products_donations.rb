class CreateProductsDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :products_donations, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true
      t.references :donation, null: false, foreign_key: true

      t.timestamps
    end

    add_index :products_donations, [:product_id, :donation_id], unique: true
  end
end
