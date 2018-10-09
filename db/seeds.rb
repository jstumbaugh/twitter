100.times do
  Status.create(description: Faker::HarryPotter.quote)
end
