class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.references :stripe_transaction

      t.timestamps
    end
  end
end
