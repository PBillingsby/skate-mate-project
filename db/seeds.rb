# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.create(city: "Philadelphia", country: "United States of America")
Location.create(city: "New York City", country: "United States of America")
Location.create(city: "Bondi Beach", country: "Australia")
Spot.create(name: "FDR Skatepark", address: "Pattinson Avenue", user_id: 1, location_id: 1, image: File.open(File.join(Rails.root,'app/assets/images/fdr.jpeg')))
Spot.create(name: "LES Skatepark", address: "62 Monroe St", user_id: 1, location_id: 2, image: File.open(File.join(Rails.root,'app/assets/images/newLESskatePark_sm.jpg')))
Spot.create(name: "FDR Skatepark", address: "Pattinson Avenue", user_id: 1, location_id: 3, image: File.open(File.join(Rails.root,'app/assets/images/bondimcredo1.jpg')))
