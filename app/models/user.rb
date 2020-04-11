class User < ApplicationRecord
  has_secure_password
  belongs_to :location, optional: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create, confirmation: true
  validates_confirmation_of :password
  accepts_nested_attributes_for :location
end
