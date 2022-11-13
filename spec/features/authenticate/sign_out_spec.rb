require "rails_helper"

feature "Sign Out" do
  before do
    create(:user, email: "example@gmail.com", password: "123456", first_name: "Bilbo", last_name: "Baggins")
  end

  scenario "Successfully Sign Out" do
    sign_in("example@gmail.com", "123456")
    click_on "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end
