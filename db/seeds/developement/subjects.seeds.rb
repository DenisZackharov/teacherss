puts "Creating subjects... "

Subject.find_or_create_by(name: "Math")
Subject.find_or_create_by(name: "History")
Subject.find_or_create_by(name: "English Language")
Subject.find_or_create_by(name: "Russian Language")
Subject.find_or_create_by(name: "Physics")
Subject.find_or_create_by(name: "Chemistry")
Subject.find_or_create_by(name: "Biology")
Subject.find_or_create_by(name: "Informatics")
Subject.find_or_create_by(name: "Geography")
Subject.find_or_create_by(name: "Litrature")
Subject.find_or_create_by(name: "Social Science")
Subject.find_or_create_by(name: "Physical Education")

puts "Done!"
