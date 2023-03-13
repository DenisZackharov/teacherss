puts "Creating organizations... "

Organization.find_or_create_by(name: "School 13") do |organization|
  organization.kind = "school"
  organization.subdomain = "school_13"
end

puts "Done!"
