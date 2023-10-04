class Donation < ApplicationRecord
  has_many :products_donations, class_name: "ProductDonation", dependent: :destroy
  has_many :products, through: :products_donations
end
