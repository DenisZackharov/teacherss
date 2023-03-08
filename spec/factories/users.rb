FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example_#{n}@example.com" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { "teacher" }
    password { "123456" }
    minimum_working_hours_per_week { 5 }
    maximum_working_hours_per_week { 10 }
    company

    trait :head_teacher do
      role { "head_teacher" }
    end

    trait :director do
      role { "director" }
    end
  end
end
