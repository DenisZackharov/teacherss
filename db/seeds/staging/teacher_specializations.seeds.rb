after "staging:subjects", "staging:field_of_studies", "staging:users" do
  puts "Creating teacher specializations... "

  teacher = User.teachers.find_by_first_name("Smeagul")
  subject = Subject.find_by_name("Math")
  field_of_study = FieldOfStudy.first

  TeacherSpecialization.find_or_create_by(
    user: teacher,
    subject: subject,
    field_of_study: field_of_study,
    degree: 10
  )

  puts "Done!"
end
