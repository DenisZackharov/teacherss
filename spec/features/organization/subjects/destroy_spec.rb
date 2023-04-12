require "rails_helper"

feature "Destroy subject" do
  before do
    create(:user, :director, email: user_email, organization: organization)
    create(:organization_subject, organization: organization, subject: subject_1)
  end

  let(:user_email) { Faker::Internet.email }
  let(:subject_1) { create(:subject, name: "English Language") }
  let(:organization) { create(:organization, name: "School 123") }

  scenario "user destoyes subject" do
    move_to_subjects_path(user_email)

    accept_confirm do
      click_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}")
    end

    expect(page).to have_content("Subject was successfully deleted!")
    expect(page).not_to have_content("English Language")
  end
end