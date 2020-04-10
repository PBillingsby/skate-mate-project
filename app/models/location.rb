class Location < ApplicationRecord
  has_many :users
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  def full_address
    [city, country, longitude, latitude].compact.join(', ')
  end
end