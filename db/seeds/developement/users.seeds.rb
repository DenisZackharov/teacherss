after "developement:organizations" do
  puts "Creating users... "
  User.destroy_all

  organization = Organization.first

  User.create!(email: "super_admin@example.com") do |user|
    user.first_name = "Gendalf"
    user.last_name = "Grey"
    user.role = "super_admin"
    user.password = "123456"
  end

  User.create!(email: "director@example.com") do |user|
    user.first_name = "Bilbo"
    user.last_name = "Baggins"
    user.role = "director"
    user.password = "123456"
    user.organization = organization
  end

  User.create!(email: "head_teacher@example.com") do |user|
    user.first_name = "Aragorn"
    user.last_name = "Aratorn"
    user.role = "head_teacher"
    user.password = "123456"
    user.minimum_working_hours_per_week = 5
    user.maximum_working_hours_per_week = 10
    user.organization = organization
  end

  User.create!(email: "teacher@example.com") do |user|
    user.first_name = "Smeagul"
    user.last_name = "Golum"
    user.role = "teacher"
    user.password = "123456"
    user.minimum_working_hours_per_week = 5
    user.maximum_working_hours_per_week = 10
    user.organization = organization
  end

  User.create!(email: "teacher2@example.com") do |user|
    user.first_name = "Legolas"
    user.last_name = "Greenleaf"
    user.role = "teacher"
    user.password = "123456"
    user.minimum_working_hours_per_week = 10
    user.maximum_working_hours_per_week = 20
    user.organization = organization
  end

  puts "Done!"
end
