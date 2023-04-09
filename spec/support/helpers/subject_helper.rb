module SubjectHelper
  def move_to_subjects_path(email)
    sign_in(email, "123456")

    click_on "School 123"
    click_on "Subjects"
  end
end
