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
  # before_save :find_or_create_location
  # def find_or_create_location
  #   byebug # FIX THIS
  # end
end