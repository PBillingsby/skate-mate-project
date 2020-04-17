# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.create(address: "Martin Place, Sydney", city: "Sydney", country: "Australia")
Location.create(address: "Love Park", city: "Philadelphia", country: "United States of America")
Location.create(address: "Wall St", city: "New York", country: "United States of America")

Spot.create(name: "The Pit", user_id: 1, location_id: 1)
Spot.create(name: "Love Park", user_id: 1, location_id: 2)
Spot.create(name: "Water Street Benches", user_id: 1, location_id: 3)