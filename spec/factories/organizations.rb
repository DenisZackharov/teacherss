FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    subdomain { name.downcase.tr(" ", "_") }
    kind { "school" }
  end
end
