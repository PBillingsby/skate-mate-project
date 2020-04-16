class Spot < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :users
  has_one_attached :img
  accepts_nested_attributes_for :location
  # ADD COMMENTS
end