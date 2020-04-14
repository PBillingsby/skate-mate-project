class Spot < ApplicationRecord
  belongs_to :location
  has_many :users, through: :locations
  # ADD COMMENTS
end