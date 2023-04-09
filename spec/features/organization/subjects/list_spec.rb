require "rails_helper"

feature "List subjects" do
  before do
    create(:organization_subject, subject: subject_1, organization: organization)
    create(:organization_subject, subject: subject_2, organization: organization)
  end

  let!(:user) { create(:user, :director, email: Faker::Internet.email, organization: organization, role: role) }
  let!(:subject_1) { create(:subject, name: "Math") }
  let!(:subject_2) { create(:subject, name: "English Language") }

  let(:organization) { create(:organization, name: "School 123") }
  let(:role) { "teacher" }

  scenario "user see list of subjects" do
    move_to_subjects_path(user.email)

    math_card = find(".card", text: "Math")

    expect(page).not_to have_link("Add Subject", href: "/organizations/#{organization.id}/subjects/new")
    expect(math_card).to have_content("Math")
    expect(page).to have_content("English Language")
    expect(math_card).not_to have_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}/edit")
    expect(math_card).not_to have_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}")
  end

  context "when user with director role" do
    let(:role) { "director" }

    scenario "user see list of subjects with links" do
      move_to_subjects_path(user.email)

      math_card = find(".card", text: "Math")

      expect(page).to have_link("Add Subject", href: "/organizations/#{organization.id}/subjects/new")
      expect(math_card).to have_content("Math")
      expect(page).to have_content("English Language")
      expect(math_card).to have_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}/edit")
      expect(math_card).to have_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}")
    end
  end
end
