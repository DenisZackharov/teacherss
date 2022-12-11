puts "Creating users... "

User.create!(first_name: "Bilbo", last_name: "Baggins", role: :director, email: "test_1@example.com",
             password: "123456")
puts "Done!"
