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
    user_move_to("example@gmail.com", "Staff")

    table = find("table")

    expect(table).to have_content("Baggins Bilbo")
    expect(table).to have_content("Director")
    expect(table).to have_content("White Gendalf")
    expect(table).to have_content("Head teacher")
  end
end
