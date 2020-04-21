class User < ApplicationRecord
  has_secure_password
  # validates :password, confirmation: true, :length => {minimum: 8}, message: "Password must be atleast 8 characters."
  has_one :check_in, :dependent => :destroy
  has_many :locations, through: :check_ins
  has_many :spots
  has_many :comments
  # has_many :comments, through: :spots

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, :on => :create, :length => {minimum: 8, message: "must be atleast 8 characters."}, confirmation: true, if: -> { password.present? }
  validates_confirmation_of :password, if: -> { password.present? }
end
