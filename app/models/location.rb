class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins
  has_many :spots
  has_one_attached :image
  geocoded_by :city
  after_validation :geocode, if: ->(obj){ obj.city.present? and obj.city_changed? }
end