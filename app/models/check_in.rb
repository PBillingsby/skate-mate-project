class CheckIn < ApplicationRecord
  belongs_to :user # Join table for user and location
  belongs_to :location
  geocoded_by :address
  after_validation :geocode
  def address
    [city, state, country].compact.join(', ')
  end
end