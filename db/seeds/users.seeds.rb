puts "Creating users... "

User.create!(first_name: "Bilbo", last_name: "Baggins", role: "super_admin", email: "test_1@example.com",
             password: "123456", maximum_working_hours: 10, minimum_working_hours: 5)
puts "Done!"
