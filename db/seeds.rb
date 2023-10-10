# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create([{ name: "Cocktail", price: 25 },
                { name: "Raffle Ticket", price: 50 },
                { name: "Sitter", price: 60 },
                { name: "Ticket", price: 125 },
                { name: "New Outfit", price: 175 },
                { name: "Silent Auction", price: 200 },
                { name: "Live Auction", price: 500 },
                { name: "Event Sponsorship", price: 2500 },
                { name: "Other", price: nil },
])
