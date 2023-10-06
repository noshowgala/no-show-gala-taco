class Product < ApplicationRecord

  def image
    name.gsub(/\s+/, '_').downcase
  end
end
