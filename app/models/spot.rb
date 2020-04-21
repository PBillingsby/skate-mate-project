class Spot < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_one :location
  has_many :users
  has_many :comments
  has_one_attached :image
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :comments
  validates :address, presence: true
end