require 'rails_helper'

RSpec.describe "User can checkout" do
  context "after adding products to the cart and clicking the Checkout button", driver: :selenium_headless, js: true do
    it "shows the correct total" do
      visit products_path

      cocktail = Product.find_by(name: 'Cocktail')
      within "[data-product-id='#{cocktail.id}']" do
        click_on "Add"
      end

      sitter = Product.find_by(name: 'Sitter')
      within "[data-product-id='#{sitter.id}']" do
        click_on "Add"
      end

      click_on "CHECKOUT (2)"

      expect(page).to have_content("$85")
    end
  end
end
