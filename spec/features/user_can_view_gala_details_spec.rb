require 'rails_helper'

RSpec.describe "User can view gala details" do
  context "when visiting the homepage" do
    it "shows information about the gala" do
      visit root_path

      expect(page).to have_content("the 6th Annual No Show Gala")
      expect(page).to have_link("R.S.V.P.")
    end
  end

  context "when clicking on the R.S.V.P. button" do
    it "shows information about the products on offer" do
      visit root_path
      click_on "R.S.V.P."

      expect(page).to have_content("the 6th Annual No Show Gala")
      expect(page).to have_content("NO cocktail")
      expect(page).to have_content("$25")
    end
  end
end
