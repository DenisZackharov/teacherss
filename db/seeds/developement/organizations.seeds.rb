after "developement:subjects" do
  puts "Creating organizations... "

  subjects = Subject.all

  Organization.find_or_create_by(name: "School 13") do |organization|
    organization.kind = "school"
    organization.subdomain = "school_13"
    organization.subjects = subjects
  end

  puts "Done!"
end
