class User < ActiveRecord::Base
  # attributes that are editable
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = user.email.downcase }

  # a Hash within a hash
   validates :name,  presence: true, length: { maximum: 50}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   uniqueness: { case_sensitive: false }

   validates :password, presence: true
   validates :password_confirmation, presence: true
end
