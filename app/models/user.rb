class User < ApplicationRecord
  has_secure_password

  has_many :check_ins
  has_many :locations, through: :check_ins 
  has_many :spots
  has_many :comments

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, :on => :create
  validates :password, :length => {minimum: 8, message: "must be at least 8 characters"}, :on => :create
  validates_confirmation_of :password
  
  accepts_nested_attributes_for :check_ins
end