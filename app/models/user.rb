class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates_confirmation_of :password
  belongs_to :location
  accepts_nested_attributes_for :location
end
