FactoryBot.define do
  factory :teacher_specialization do
    subject
    user
    field_of_study
    degree { 1 }
  end
end
