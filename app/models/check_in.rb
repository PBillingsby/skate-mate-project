class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :location
  before_save :check_in

end