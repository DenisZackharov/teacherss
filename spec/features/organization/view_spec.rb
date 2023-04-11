require "rails_helper"

feature "View organization" do
  before do
    create(
      :user,
      role: role,
      first_name: "Bilbo",
      last_name: "Baggins",
      email: "example@gmail.com",
      organization: organization
    )
  end

  let(:role) { "teacher" }
  let(:organization) { create(:organization, name: "School 123") }

  scenario "User views organization page" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"

    h_1 = find("h1")

    expect(h_1).to have_content("School 123")
    expect(page).not_to have_content("Staff")
    expect(page).to have_content("Subjects")
    expect(page).to have_content("Field Of Studies")
  end

  context "when user has director role" do
    let(:role) { "director" }

    scenario "User views organization page" do
      sign_in("example@gmail.com", "123456")

      click_on "School 123"

      h_1 = find("h1")

      expect(h_1).to have_content("School 123")
      expect(page).to have_content("Staff")
      expect(page).to have_content("Subjects")
      expect(page).to have_content("Field Of Studies")
    end
  end
end
