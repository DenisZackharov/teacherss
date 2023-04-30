require "rails_helper"

feature "Update field of study" do
  before do
    create(:user, :director, email: user_email, organization: organization)
    create(:organization_field_of_study, organization: organization, field_of_study: field_of_study)
    create(:organization_field_of_study, organization: organization)
  end

  let(:user_email) { Faker::Internet.email }
  let(:field_of_study) { create(:field_of_study, name: "Base") }
  let(:organization) { create(:organization, name: "School 123") }

  scenario "user updates field of study" do
    user_move_to(user_email, "Field Of Studies")

    click_link(href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study.id}/edit")

    fill_in "field_of_study_name", with: "Humanitarian"
    click_on "Update"

    expect(page).to have_content("Field Of Study was successfully updated!")
    expect(page).to have_content("Humanitarian")
    expect(page).not_to have_content("Base")
  end

  scenario "user try to updates field of study with blank name" do
    user_move_to(user_email, "Field Of Studies")

    click_link(href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study.id}/edit")

    fill_in "field_of_study_name", with: ""
    click_on "Update"

    expect(page).to have_content("Field Of Study invalid: Name can't be blank")
  end

  scenario "user try to updates field of study with existed name for this organization" do
    user_move_to(user_email, "Field Of Studies")

    click_link(href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study.id}/edit")

    fill_in "field_of_study_name", with: "Physical and mathematical"
    click_on "Update"

    expect(page).to have_content(
      "Organization Field Of Study invalid: Field of study already exists for this organization"
    )
  end
end
