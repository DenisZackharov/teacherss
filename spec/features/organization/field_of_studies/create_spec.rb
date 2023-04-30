require "rails_helper"

feature "Create field of study" do
  before do
    create(:user, :director, email: user_email, organization: organization)
    create(:organization_field_of_study, organization: organization, field_of_study: field_of_study)
  end

  let(:user_email) { Faker::Internet.email }
  let(:field_of_study) { create(:field_of_study, name: "Base") }
  let(:organization) { create(:organization, name: "School 123") }
  let(:before_organization_field_of_studies_count) { 1 }

  scenario "user creates field of study" do
    user_move_to(user_email, "Field Of Studies")

    click_on "Add Field Of Study"

    fill_in "field_of_study_name", with: "Physical-Mathematical"
    click_on "Create"

    expect(page).to have_content("Field Of Study was successfully created!")
    expect(page).to have_content("Physical-Mathematical")
    expect(OrganizationFieldOfStudy.count).to eq(before_organization_field_of_studies_count + 1)
  end

  scenario "user try to creates field of study with blank name" do
    user_move_to(user_email, "Field Of Studies")

    click_on "Add Field Of Study"

    fill_in "field_of_study_name", with: ""
    click_on "Create"

    expect(page).to have_content("Field Of Study invalid: Name can't be blank")
    expect(OrganizationFieldOfStudy.count).to eq(before_organization_field_of_studies_count)
  end

  scenario "user try to creates field of study with existed name for this organization" do
    user_move_to(user_email, "Field Of Studies")

    click_on "Add Field Of Study"

    fill_in "field_of_study_name", with: "Base"
    click_on "Create"

    expect(page).to have_content(
      "Organization Field Of Study invalid: Field of study already exists for this organization"
    )
    expect(OrganizationFieldOfStudy.count).to eq(before_organization_field_of_studies_count)
  end
end
