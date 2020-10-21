class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins
  has_many :spots
  # has_one_attached :image

  # geocoded_by :city
  # before_create {self.city = self.city.titleize}
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.city.present? and obj.city_changed? }

  def address
    [city, state, country].compact.join(', ')
  end
  
  accepts_nested_attributes_for :check_ins
end