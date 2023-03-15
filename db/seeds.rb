# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating users"
User.create(email: "maxreid@email.com", password: "password")
# puts "creating uncategorised list"
# List.create(name: "Uncategorised", user_id: 1)
puts "removing old lists"
List.destroy_all
puts "done"
