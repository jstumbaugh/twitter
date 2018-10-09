FactoryBot.define do
  factory :status do
    description { Faker::HarryPotter.quote }
  end
end
