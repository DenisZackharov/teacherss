puts "Creating companies... "

Company.find_or_create_by(name: "School 13") do |company|
  company.kind = "school"
  company.subdomain = "school_13"
end

puts "Done!"
