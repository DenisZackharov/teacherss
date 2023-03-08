FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    subdomain { name.downcase.delete(" ") }
    kind { "school" }
  end
end
