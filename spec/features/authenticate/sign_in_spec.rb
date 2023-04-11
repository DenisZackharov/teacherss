require "rails_helper"

feature "Sign In" do
  let!(:organization) { create(:organization, name: "School 13") }

  before do
    create(
      :user,
      :director,
      organization: organization,
      email: "example@gmail.com",
      password: "123456",
      first_name: "Bilbo",
      last_name: "Baggins"
    )
  end

  scenario "with valid credentials" do
    sign_in("example@gmail.com", "123456")
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("School 13")
  end

  scenario "with invalid credentials" do
    sign_in("abc@abc.com", "wrong password")

    expect(page).to have_content("Sign In")
    expect(page).to have_content("Invalid Email or password.")
  end
end
