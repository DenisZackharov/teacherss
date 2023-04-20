puts "Creating subjects... "

Subject.find_or_create_by(name: "Math")

puts "Done!"
