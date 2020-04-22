class User < ApplicationRecord
  has_secure_password
  has_many :check_ins
  has_many :locations, through: :check_ins 
  has_many :spots
  has_many :comments
  # has_many :comments, through: :spots
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, :length => {minimum: 8, message: "must be at least 8 characters."}
  validates_confirmation_of :password
  validates :username, presence: true
end