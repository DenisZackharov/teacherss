require "rails_helper"

feature "Destroy field of study" do
  before do
    create(:user, :director, email: user_email, organization: organization)
    create(:organization_field_of_study, organization: organization, field_of_study: field_of_study)
  end

  let(:user_email) { Faker::Internet.email }
  let(:field_of_study) { create(:field_of_study, name: "Base") }
  let(:organization) { create(:organization, name: "School 123") }

  scenario "user destoyes field of study" do
    user_move_to(user_email, "Field Of Studies")

    accept_confirm do
      click_link(href: "/organizations/#{organization.id}/field_of_studies/#{field_of_study.id}")
    end

    expect(page).to have_content("Field Of Study was successfully deleted!")
    expect(page).not_to have_content("Base")
  end
end
