require "rails_helper"

feature "List teacher specializations" do
  before do
    create(:user, :director, email: "director@example.com", organization: organization)
    create(
      :teacher_specialization,
      user: teacher_1,
      field_of_study: field_of_study_1,
      subject: subject_1,
      degree: 7
    )
    create(
      :teacher_specialization,
      user: teacher_2,
      field_of_study: field_of_study_2,
      subject: subject_2,
      degree: 5
    )
    create(:organization_subject, subject: subject_1, organization: organization)
    create(:organization_subject, subject: subject_2, organization: organization)
    create(:organization_field_of_study, field_of_study: field_of_study_1, organization: organization)
    create(:organization_field_of_study, field_of_study: field_of_study_2, organization: organization)

    user_move_to("director@example.com", "Teacher Specializations")
  end

  let(:organization) { create(:organization, name: "School 123") }

  let(:teacher_1) { create(:user, :teacher, first_name: "John", last_name: "Doe", organization: organization) }
  let(:teacher_2) do
    create(:user, :teacher, first_name: "Jane", last_name: "Doe", middle_name: "Sue", organization: organization)
  end
  let(:field_of_study_1) { create(:field_of_study, name: "Base") }
  let(:field_of_study_2) { create(:field_of_study, name: "Physical and mathematical") }
  let(:subject_1) { create(:subject, name: "Math") }
  let(:subject_2) { create(:subject, name: "English") }

  scenario "user see list of teacher specializations" do
    table = find("table")

    expect(table).to have_content("Doe J.")
    expect(table).to have_content("Base")
    expect(table).to have_content("Math")
    expect(table).to have_content(7)
    expect(table).to have_content("Doe J. S.")
    expect(table).to have_content("Physical and mathematical")
    expect(table).to have_content("English")
    expect(table).to have_content(5)
  end

  scenario "with teacher filter" do
    select "Doe J.", from: :q_user_id_eq
    click_on "▶"

    table = find("table")

    expect(table).to have_content("Doe J.")
    expect(table).not_to have_content("Doe J. S.")
  end

  scenario "with subject filter" do
    select "English", from: :q_subject_id_eq
    click_on "▶"

    table = find("table")

    expect(table).not_to have_content("Math")
    expect(table).to have_content("English")
  end

  scenario "with field of study filter" do
    select "Physical and mathematical", from: :q_field_of_study_id_eq
    click_on "▶"

    table = find("table")

    expect(table).to have_content("Physical and mathematical")
    expect(table).not_to have_content("Base")
  end

  scenario "with degree filter" do
    fill_in :q_degree_eq, with: 4
    click_on "▶"

    table = find("table")

    expect(table).not_to have_content("Doe J.")
    expect(table).not_to have_content("Doe J. S.")
  end
end
