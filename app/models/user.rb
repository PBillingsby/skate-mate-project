class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates_confirmation_of :password
  has_one :location
  geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
  accepts_nested_attributes_for :location
end
