class User < ApplicationRecord
  has_secure_password
  belongs_to :location
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :on => :create, confirmation: true, if: -> { password.present? }
  validates_confirmation_of :password, if: -> { password.present? }
  # accepts_nested_attributes_for :location
  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
			user.uid = auth.uid
			user.username = auth.info.username
			user.email = auth.info.email
			user.save!
		end
	end
end
