puts "Creating field of studies... "
FieldOfStudy.destroy_all

FieldOfStudy.create!(name: "Physical and mathematical")
FieldOfStudy.create!(name: "Based")
FieldOfStudy.create!(name: "Humanitarian")
FieldOfStudy.create!(name: "Chemical and biological")

puts "Done!"
