class User < ApplicationRecord
  has_secure_password
  has_many :check_in
  has_many :locations, through: :check_ins
  # has_many :spots, through: :locations
  # has_many :comments, through: :spots

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create, confirmation: true, if: -> { password.present? }
  validates_confirmation_of :password, if: -> { password.present? }
  # accepts_nested_attributes_for :location
  def self.find_or_create_from_auth_hash(auth)
    byebug
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
			user.uid = auth.uid
			user.username = auth.info.username
			user.email = auth.info.email
			user.save!
		end
	end
end
