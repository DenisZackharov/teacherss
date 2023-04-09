require "rails_helper"

feature "Update subject" do
  before do
    create(:user, :director, email: "example@gmail.com", organization: organization)
    create(:organization_subject, organization: organization, subject: subject_1)
    create(:organization_subject, organization: organization)
  end

  let(:subject_1) { create(:subject, name: "English Language") }
  let(:organization) { create(:organization, name: "School 123") }

  scenario "user updates subject" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
    click_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}/edit")

    fill_in "subject_name", with: "English"
    click_on "Update"

    expect(page).to have_content("Subject was successfully updated!")
    expect(page).to have_content("English")
    expect(page).not_to have_content("English Language")
  end

  scenario "user try to updates subject with blank name" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
    click_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}/edit")

    fill_in "subject_name", with: ""
    click_on "Update"

    expect(page).to have_content("Subject invalid: Name can't be blank")
  end

  scenario "user try to updates subject with existed name for this organization" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
    click_link(href: "/organizations/#{organization.id}/subjects/#{subject_1.id}/edit")

    fill_in "subject_name", with: "Math"
    click_on "Update"

    expect(page).to have_content("OrganizationSubject invalid: Subject already exists for this organization")
  end
end
