FactoryBot.define do
  factory :tweet do
    description { Faker::HarryPotter.quote }
  end
end
