require "rails_helper"

feature "Sign Up" do
  scenario "Sign Up with valid attributes" do
    visit new_user_registration_path

    fill_in "user_first_name",	with: "John"
    fill_in "user_last_name",	with: "Doe"
    fill_in "user_email",	with: "john.doe@example.com"
    fill_in "user_password",	with: "password"
    fill_in "user_password_confirmation",	with: "password"

    click_on "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(User.count).to eq(1)
  end

  scenario "Sign Up with invalid attributes" do
    visit new_user_registration_path

    fill_in "user_first_name",	with: "John"
    fill_in "user_last_name",	with: "Doe"
    fill_in "user_email",	with: "john"
    fill_in "user_password",	with: "password"
    fill_in "user_password_confirmation",	with: "pas"

    click_on "Sign up"

    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.count).to eq(0)
  end

  scenario "Sign Up with existing email" do
    visit new_user_registration_path

    create(:user, email: "john.doe@example.com")

    fill_in "user_first_name",	with: "John"
    fill_in "user_last_name",	with: "Doe"
    fill_in "user_email",	with: "john.doe@example.com"
    fill_in "user_password",	with: "password"
    fill_in "user_password_confirmation",	with: "password"

    click_on "Sign up"

    expect(page).to have_content("Email has already been taken")
  end
end
