after "developement:subjects", "developement:field_of_studies", "developement:users" do
  puts "Creating teacher specializations... "
  TeacherSpecialization.destroy_all

  teachers = User.teachers
  subjects = Subject.all
  field_of_studies = FieldOfStudy.all

  field_of_studies.each do |field_of_study|
    subjects.each do |subject|
      teachers.each do |teacher|
        TeacherSpecialization.create!(
          user: teacher,
          subject: subject,
          field_of_study: field_of_study,
          degree: (1..10).to_a.sample
        )
      end
    end
  end

  puts "Done!"
end
