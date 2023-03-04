require "rails_helper"

feature "Update user" do
  before do
    create(
      :user,
      :director,
      email: "example@gmail.com",
      first_name: "Bilbo",
      last_name: "Baggins"
    )
  end

  scenario "edit with current password" do
    sign_in("example@gmail.com", "123456")

    click_on "Bilbo Baggins"

    fill_in "user_first_name", with: "John"
    fill_in "user_last_name", with: "Doe"
    fill_in "user_current_password",	with: "123456"

    click_on "Update"

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("John Doe")
  end

  scenario "edit without current password" do
    sign_in("example@gmail.com", "123456")

    click_on "Bilbo Baggins"

    fill_in "user_first_name", with: "John"
    fill_in "user_last_name", with: "Doe"

    click_on "Update"

    expect(page).to have_content("Current password can't be blank")
  end
end
