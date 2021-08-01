require 'open-uri'

namespace :products do
  desc "This task creates products"
  task :create => :environment do
    products = [
      {
        name: "Shoes",
        price: Faker::Commerce.price(range: 60..90.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/1464625/pexels-photo-1464625.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Gold and Silver Ring",
        price: Faker::Commerce.price(range: 100..150.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/8891957/pexels-photo-8891957.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Bag",
        price: Faker::Commerce.price(range: 20..50.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/3661622/pexels-photo-3661622.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Silver Ring",
        price: Faker::Commerce.price(range: 90..100.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/8398935/pexels-photo-8398935.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Black DSLR Camera",
        price: Faker::Commerce.price(range: 200..250.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/3878617/pexels-photo-3878617.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
      },
      {
        name: "Mobile Phone",
        price: Faker::Commerce.price(range: 200..300.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/1260239/pexels-photo-1260239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Brush and Lipstick",
        price: Faker::Commerce.price(range: 10..25.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/3750640/pexels-photo-3750640.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Bike",
        price: Faker::Commerce.price(range: 250..300.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/2393835/pexels-photo-2393835.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
      },
      {
        name: "Laptop",
        price: Faker::Commerce.price(range: 300..450.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/7693229/pexels-photo-7693229.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      },
      {
        name: "Hand Watch",
        price: Faker::Commerce.price(range: 100..150.0),
        quantity: Faker::Number.between(from: 10, to: 25),
        image: "https://images.pexels.com/photos/179908/pexels-photo-179908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
      }
    ]
    products.each do |p|
      product = Product.new(name: p[:name], price: p[:price], quantity: p[:quantity])
      image_url = URI.parse(p[:image])
      image_file = URI.open(image_url)
      product.image.attach(io: image_file, filename: "#{p[:name].parameterize.underscore}.png")
      product.save
    end
  end
end