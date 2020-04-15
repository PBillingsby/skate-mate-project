class Spot < ApplicationRecord
  belongs_to :location
  has_many :users, through: :locations
  accepts_nested_attributes_for :location
  # ADD COMMENTS
end