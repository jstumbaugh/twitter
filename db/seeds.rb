100.times do
  Tweet.create(description: Faker::HarryPotter.quote)
end
