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
tp User.all

# create random shops
5.times do 
  Shop.create!(
    name: Faker::Commerce.department
  )
end
puts "*" * 20
puts "shops"
tp Shop.all

5.times do
  Product.create!(
    shop: Shop.all.sample
  )
end
puts "*" * 20
puts "Product"
tp Product.all