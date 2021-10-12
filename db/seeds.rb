# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used value for all generators

Product.delete_all

676.times do
  product = Product.create(
    title: Faker::Name.name,
    price: Faker::Commerce.price,
    stock_quantity: Faker::Number.number
  )
end

puts "Create #{Product.count} products."