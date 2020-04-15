class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  
end