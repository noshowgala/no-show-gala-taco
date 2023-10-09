require 'rails_helper'

RSpec.describe "User can enter 'other' donation amount", js: true, driver: :selenium_headless do
  it "shows the correct empty field" do
    other = Product.create(name: "Other", price: 0)

    visit products_path

    within "[data-product-id='#{other.id}']" do
      click_on "Enter amount"
      expect(page).to have_content("$")
      expect(page).not_to have_content("Enter amount")
    end

    expect(page).to have_content("CHECKOUT (0)")

    within "[data-product-id='#{other.id}']" do
      fill_in("otherFinalPrice", with: 100)
      find_button("Add").click
      # click_on "Add"
      save_and_open_screenshot
      expect(page).to have_button("Added", wait: 10)
      expect(page).to have_content("$100")
    end

    expect(page).to have_content("CHECKOUT (1)")
 
    within "[data-product-id='#{other.id}']" do
      click_on("Added")
      expect(page).not_to have_content("$100")
    end

    expect(page).to have_content("CHECKOUT (0)")
  end
end
