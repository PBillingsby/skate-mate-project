class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins
  has_many :spots
  has_one_attached :image
  geocoded_by :city
  after_validation :geocode, if: ->(obj){ obj.city.present? and obj.city_changed? }
  accepts_nested_attributes_for :check_ins
  
  def self.location_create(location)
    new_loc = Geocoder.search(location).first
    @location = Location.find_or_create_by(city: location.city, country: location.country)
  end
end