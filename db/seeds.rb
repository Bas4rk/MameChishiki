# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "tarezou",
             email: "tarezou@gmail.com",
             password: "123456")

50.times do |n|
  name  = "test_user_#{n+1}"
  email = "example#{n+1}@gmail.com"
  password = "123456"
  User.create!(username:  name,
               email: email,
               password: password)
end

users = User.order(:created_at).take(6)
50.times do |n|
  title = "sampletitle#{n}"
  content = "sampletext#{n}"
  users.each { |user| user.posts.create!(title: title,content: content)}
end
