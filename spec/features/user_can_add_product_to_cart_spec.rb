require 'rails_helper'

RSpec.describe "User can add product to cart" do
  context "when viewing the product page" do
    it "does not indicate that any items have been added to the cart" do
      visit products_path

      expect(page).not_to have_content("Added")
      expect(page).not_to have_content("CHECKOUT (")
    end
  end

  context "when clicking on the 'Add' button", js: true do
    it "adds the item to the cart" do
      visit products_path
      cocktail = Product.find_by(name: 'Cocktail')

      within "[data-product-id='#{cocktail.id}']" do
        click_on "Add"
      end

      expect(page).to have_content("Added")
      expect(page).to have_content("CHECKOUT (1)")
    end
  end
end
