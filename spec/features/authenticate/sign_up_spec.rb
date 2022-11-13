require "rails_helper"

feature "Sign Up" do
  scenario "Sign Up with valid attributes" do
    visit new_user_registration_path

    fill_in "First name",	with: "John"
    fill_in "Last name",	with: "Doe"
    fill_in "Email",	with: "john.doe@example.com"
    find("div.user_password").fill_in "Password",	with: "password"
    fill_in "Password confirmation",	with: "password"

    click_on "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(User.count).to eq(1)
  end

  scenario "Sign Up with invalid attributes" do
    visit new_user_registration_path

    fill_in "First name",	with: "John"
    fill_in "Last name",	with: "Doe"
    fill_in "Email",	with: "john"
    find("div.user_password").fill_in "Password",	with: "password"
    fill_in "Password confirmation",	with: "pas"

    click_on "Sign up"

    expect(page).to have_content("Please review the problems below:")
    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.count).to eq(0)
  end
end
