user = User.create(username: "voldemort", password: "password")

100.times do
  tweet = Tweet.create(description: Faker::HarryPotter.quote, user: user)

  Like.create(user: user, tweet: tweet)
end
