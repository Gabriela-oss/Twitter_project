# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tweet.destroy_all
User.destroy_all

50.times do
  user = User.create(email: Faker::Internet.email, photo: Faker::Avatar.image(size: "50x50"), name: Faker::Name.name, password: 123123)
  
  puts "User has been created #{user.name}"
  
  7.times do 
    tweet = user.tweets.build(content: Faker::Lorem.sentence)
    tweet.save
  end
end 
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? 