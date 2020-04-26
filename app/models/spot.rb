class Spot < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :users
  has_many :comments
  has_one_attached :image
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :comments
  validates :name, presence: true
  validates :address, presence: true
  scope :highest_rating, -> { where("spot(rating) == ?", 5) }
end