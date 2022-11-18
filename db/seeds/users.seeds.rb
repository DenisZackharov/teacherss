puts "Creating users... "

User.create!(first_name: "Bilbo", last_name: "Baggins", role: :director, email: "test_1@example.com",
             password: "123456", minimum_working_hours_per_week: 5, maximum_working_hours_per_week: 10)
puts "Done!"
