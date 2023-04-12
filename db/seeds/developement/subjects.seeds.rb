puts "Creating subjects... "
Subject.destroy_all

Subject.create!(name: "Math")
Subject.create!(name: "History")
Subject.create!(name: "English Language")
Subject.create!(name: "Russian Language")
Subject.create!(name: "Physics")
Subject.create!(name: "Chemistry")
Subject.create!(name: "Biology")
Subject.create!(name: "Informatics")
Subject.create!(name: "Geography")
Subject.create!(name: "Literature")
Subject.create!(name: "Social Science")
Subject.create!(name: "Physical Education")

puts "Done!"
