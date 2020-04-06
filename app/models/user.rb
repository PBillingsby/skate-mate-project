class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  belongs_to :location
  accepts_nested_attributes_for :location
end
