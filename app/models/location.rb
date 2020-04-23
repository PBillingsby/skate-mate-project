class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins, dependent: :destroy
  has_many :spots
  has_one_attached :image
  geocoded_by :city
  after_validation :geocode, if: ->(obj){ obj.city.present? and obj.city_changed? }
  accepts_nested_attributes_for :check_ins
  def country_compact
    byebug
  end
end