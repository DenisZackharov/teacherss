puts "Creating field of studies... "

FieldOfStudy.find_or_create_by(name: "Physical and mathematical")
FieldOfStudy.find_or_create_by(name: "Based")
FieldOfStudy.find_or_create_by(name: "Humanitarian")
FieldOfStudy.find_or_create_by(name: "Chemical and biological")

puts "Done!"
