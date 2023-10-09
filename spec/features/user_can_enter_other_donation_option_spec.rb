require 'rails_helper'

RSpec.describe "User can enter 'other' donation amount" do
  it "shows the correct empty field" do
    other = Product.create(name: "Other", price: 0)

    visit products_path

    within "[data-product-id='#{other.id}']" do
      click_on "Enter amount"
      expect(page).to have_content("$")
      expect(page).to have_content("Checkout (0)")

      fill_in("product_price", with: "100")
      click_on ("Add")
      expect(page).to have_content("$100 Added")
      expect(page).to have_content("Checkout (1)")

      click_on("Added")
      expect(page).not_to have_content("$100 Added")
      expect(page).to have_content("Checkout (0)")
    end
  end
end
