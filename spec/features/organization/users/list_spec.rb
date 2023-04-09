require "rails_helper"

feature "List users" do
  before do
    create(
      :user,
      :director,
      first_name: "Bilbo",
      last_name: "Baggins",
      email: "example@gmail.com",
      organization: organization
    )
    create(
      :user,
      :head_teacher,
      first_name: "Gendalf",
      last_name: "White",
      organization: organization
    )
  end

  let(:organization) { create(:organization, name: "School 123") }

  scenario "User views staff table" do
    sign_in("example@gmail.com", "123456")

    expect(page).to have_content("School 123")

    click_on "School 123"

    expect(page).to have_link("Staff", href: "/organizations/#{organization.id}/users")

    click_on "Staff"

    table = find("table")

    expect(table).to have_content("Baggins Bilbo")
    expect(table).to have_content("Director")
    expect(table).to have_content("White Gendalf")
    expect(table).to have_content("Head teacher")
  end
end
