after "developement:subjects" do
  puts "Creating companies... "

  subjects = Subject.all

  Company.find_or_create_by(name: "School 13") do |company|
    company.kind = "school"
    company.subdomain = "school_13"
    company.subjects = subjects
  end

  puts "Done!"
end
