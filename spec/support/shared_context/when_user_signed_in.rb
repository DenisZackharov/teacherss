shared_context "when user signed in" do
  before do
    create(:user, email: "example@gmail.com", password: "123456")

    visit new_user_session_path

    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "123456"

    click_button "Log in"
  end
end
