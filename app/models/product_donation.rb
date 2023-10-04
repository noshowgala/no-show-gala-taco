class ProductDonation < ApplicationRecord
  self.primary_key = 'id'
  self.table_name = "products_donations"
  belongs_to :product
  belongs_to :donation
end
