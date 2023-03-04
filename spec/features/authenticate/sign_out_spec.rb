require "rails_helper"

feature "Sign Out" do
  include_context "when user signed in"

  scenario "user sign out successfully" do
    click_on "Sign Out"

    expect(page).to have_content("Signed out successfully.")
  end
end
