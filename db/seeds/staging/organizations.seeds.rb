after "staging:subjects", "staging:field_of_studies" do
  puts "Creating organizations... "

  subjects = Subject.all
  field_of_studies = FieldOfStudy.all

  Organization.find_or_create_by(name: "School 13") do |organization|
    organization.kind = "school"
    organization.subdomain = "school_13"
    organization.subjects = subjects
    organization.field_of_studies = field_of_studies
  end

  puts "Done!"
end
