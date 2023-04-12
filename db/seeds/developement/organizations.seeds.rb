after "developement:subjects", "developement:field_of_studies" do
  puts "Creating organizations... "
  Organization.destroy_all

  subjects = Subject.all
  field_of_studies = FieldOfStudy.all

  Organization.create!(name: "School 13") do |organization|
    organization.kind = "school"
    organization.subdomain = "school_13"
    organization.subjects = subjects
    organization.field_of_studies = field_of_studies
  end

  puts "Done!"
end
