require "csv"

# Faker::Name.unique.clear # Clears used values for Faker::Name
# Faker::UniqueGenerator.clear # Clears used value for all generators

Product.delete_all
Category.delete_all

# 676.times do
#   product = Product.create(
#     title: Faker::Name.name,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.number
#   )
# end

# puts "Create #{Product.count} products."

filename = Rails.root.join("db/products.csv")

puts "Loading Products from csv file: #{filename}"

csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |p|
  cat = Category.find_or_create_by(name: p["category"])

  if cat && cat.valid?
    # Create a product here
    product = cat.products.create(
      title: p["name"],
      description: p["description"],
      price: p["price"],
      stock_quantity: p["stock quantity"]
    )

    puts "Invalid product #{p["name"]}" unless product&.valid?
  else
    puts "Invalid Category, #{p["category"]} for product: #{p["name"]}"
  end
end

puts "Created #{Category.count} Categories."
puts "Created #{Product.count} Products."