# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.create!(
  name: "Chonkchilla",
  email: "chonky@gmail.com",
  password: "test",
  api_key: "1234567890"
)

user_2 = User.create!(
  name: "Simon",
  email: "simon@gmail.com",
  password: "test",
  api_key: "9876543210"
)

favorite_1 = Favorite.create!(
  country: "Canada",
  recipe_link: "www.ehfoods.com",
  recipe_title: "poutine",
  user_id: user_1.id
)

favorite_2 = Favorite.create!(
  country: "Mexico",
  recipe_link: "www.spicyfoods.com",
  recipe_title: "nachos",
  user_id: user_1.id
)
