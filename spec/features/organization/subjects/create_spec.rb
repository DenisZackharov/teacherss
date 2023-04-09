require "rails_helper"

feature "Create subject" do
  before do
    create(:user, :director, email: "example@gmail.com", organization: organization)
    create(:organization_subject, organization: organization, subject: subject_1)
  end

  let(:subject_1) { create(:subject, name: "English Language") }
  let(:organization) { create(:organization, name: "School 123") }
  let(:before_organization_subjects_count) { 1 }

  scenario "user creates subject" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
    click_on "Add Subject"

    fill_in "subject_name", with: "Math"
    click_on "Create"

    expect(page).to have_content("Subject was successfully created!")
    expect(page).to have_content("Math")
    expect(OrganizationSubject.count).to eq(before_organization_subjects_count + 1)
  end

  scenario "user try to creates subject with blank name" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
    click_on "Add Subject"

    fill_in "subject_name", with: ""
    click_on "Create"

    expect(page).to have_content("Subject invalid: Name can't be blank")
    expect(OrganizationSubject.count).to eq(before_organization_subjects_count)
  end

  scenario "user try to creates subject with existed name for this organization" do
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
    click_on "Add Subject"

    fill_in "subject_name", with: "English Language"
    click_on "Create"

    expect(page).to have_content("OrganizationSubject invalid: Subject already exists for this organization")
    expect(OrganizationSubject.count).to eq(before_organization_subjects_count)
  end
end
