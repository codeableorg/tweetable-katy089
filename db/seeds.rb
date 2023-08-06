# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "seeding data"

puts "Sedding admin and users"
admin = User.create(name: "admin", username: "adminpro", email: "admin@mail.com", password: "supersecret", password_confirmation: "supersecret")


puts "Seeding tweets"


puts "Seeding subtweets"



puts "Sedding likes"


puts "Finish Sedding"
