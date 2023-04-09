module SubjectHelper
  def move_to_subjects_path
    sign_in("example@gmail.com", "123456")

    click_on "School 123"
    click_on "Subjects"
  end
end
