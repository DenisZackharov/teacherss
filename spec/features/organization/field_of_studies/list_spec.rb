require "rails_helper"

feature "List field of studies" do
  before do
    create(:user, :director, email: user_email, organization: organization, role: role)
    create(:organization_field_of_study, field_of_study: field_of_study_1, organization: organization)
    create(:organization_field_of_study, field_of_study: field_of_study_2, organization: organization)
  end

  let!(:field_of_study_1) { create(:field_of_study, name: "Base") }
  let!(:field_of_study_2) { create(:field_of_study, name: "Humanitarian") }

  let(:user_email) { Faker::Internet.email }
  let(:organization) { create(:organization, name: "School 123") }
  let(:role) { "teacher" }

  scenario "user see list of field of studies" do
    user_move_to(user_email, "Field Of Studies")

    math_card = find(".card", text: "Base")

    expect(page).not_to have_link("Add Field Of Study", href: "/organizations/#{organization.id}/field_of_studies/new")
    expect(math_card).to have_content("Base")
    expect(page).to have_content("Humanitarian")
    expect(math_card).not_to have_link(
      href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study_1.id}/edit"
    )
    expect(math_card).not_to have_link(
      href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study_1.id}"
    )
  end

  context "when user with director role" do
    let(:role) { "director" }

    scenario "user see list of field of studies with links" do
      user_move_to(user_email, "Field Of Studies")

      math_card = find(".card", text: "Base")

      expect(page).to have_link("Add Field Of Study", href: "/organizations/#{organization.id}/field_of_studies/new")
      expect(math_card).to have_content("Base")
      expect(page).to have_content("Humanitarian")
      expect(math_card).to have_link(
        href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study_1.id}/edit"
      )
      expect(math_card).to have_link(
        href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study_1.id}"
      )
    end
  end
end
