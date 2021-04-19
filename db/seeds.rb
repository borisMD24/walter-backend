# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# create random users
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "coucou"
  )
end
puts "*" * 20
puts "Users"
puts "*" * 20
tp User.all
puts "*" * 20

# create 3 shops: 

## first shop sells beers:
beer = Shop.create!(
    name: "Beer Garden"
)

Product.create!(
  shop: beer,
  name: Faker::Beer.name,
  price: 1000,
  quantity: 10,
  description: Faker::Beer.style
)

Product.create!(
  shop: beer,
  name: Faker::Beer.name,
  price: 1200,
  quantity: 15,
  description: Faker::Beer.style
)

Product.create!(
  shop: beer,
  name: Faker::Beer.name,
  price: 2000,
  quantity: 20,
  description: Faker::Beer.style
)

puts "*" * 20
puts "Beer shop"
puts "*" * 20
tp beer.products
puts "*" * 20

## second shop is a restaurant:

restaurant = Shop.create!(
  name: "the good food"
)

Product.create!(
  shop: restaurant,
  name: Faker::Food.dish,
  price: 100,
  quantity: 200,
  description: Faker::Food.description
)

Product.create!(
  shop: restaurant,
  name: Faker::Food.dish,
  price: 1000,
  quantity: 50,
  description: Faker::Food.description
)

Product.create!(
  shop: restaurant,
  name: Faker::Food.dish,
  price: 150,
  quantity: 20,
  description: Faker::Food.description
)

Product.create!(
  shop: restaurant,
  name: Faker::Food.dish,
  price: 200,
  quantity: 100,
  description: Faker::Food.description
)

puts "*" * 20
puts "Restaurant: the good food"
puts "*" * 20
tp restaurant.products
puts "*" * 20

## third shop is a coffee shop:

coffee = Shop.create!(
  name: "great coffee"
)

Product.create!(
  shop: coffee,
  name: Faker::Coffee.blend_name,
  price: 10,
  quantity: 150,
  description: Faker::Coffee.notes
)

Product.create!(
  shop: coffee,
  name: Faker::Coffee.blend_name,
  price: 50,
  quantity: 250,
  description: Faker::Coffee.notes
)

Product.create!(
  shop: coffee,
  name: Faker::Coffee.blend_name,
  price: 20,
  quantity: 120,
  description: Faker::Coffee.notes
)

Product.create!(
  shop: coffee,
  name: Faker::Coffee.blend_name,
  price: 15,
  quantity: 180,
  description: Faker::Coffee.notes
)

puts "*" * 20
puts "coffee shop:"
puts "*" * 20
tp coffee.products
puts "*" * 20





