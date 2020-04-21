class CheckIn < ApplicationRecord
  belongs_to :user # Join table for user and location
  belongs_to :location
end