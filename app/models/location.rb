class Location < ApplicationRecord
  has_many :users
  geocoded_by :address
  after_validation :geocode
end