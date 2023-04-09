require "rails_helper"

feature "Destroy subject" do
  before do
    create(:organization_subject, organization: organization, subject: subject_1)
  end

  let!(:user) { create(:user, :director, email: Faker::Internet.email, organization: organization) }

  let(:subject_1) { create(:subject, name: "English Language") }
  let(:organization) { create(:organization, name: "School 123") }

  scenario "user destoyes subject" do
    move_to_subjects_path(user.email)

    accept_confirm do
      click_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}")
    end

    expect(page).to have_content("Subject was successfully deleted!")
    expect(page).not_to have_content("English Language")
  end
end
