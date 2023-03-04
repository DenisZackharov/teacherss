require "rails_helper"

feature "Destroy user" do
  before do
    create(
      :user,
      :director,
      email: "example@gmail.com",
      first_name: "Bilbo",
      last_name: "Baggins"
    )
  end

  scenario "user deletes his account" do
    sign_in("example@gmail.com", "123456")
    click_on "Bilbo Baggins"

    click_on "Delete my account"

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    expect(page).to have_content("Sign In")
    expect(User.count).to eq(0)
  end
end
