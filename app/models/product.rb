class Product < ApplicationRecord
  has_many :products_donations, class_name: "ProductDonation", dependent: :destroy
  has_many :donations, through: :products_donations
end

  def image
    name.gsub(/\s+/, '_').downcase
  end
end
