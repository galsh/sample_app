class User < ActiveRecord::Base
  # attributes that are editable
  # admin should not appear here so that a user cant post admin = true
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  # a Hash within a hash
   validates :name,  presence: true, length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   uniqueness: { case_sensitive: false }

   validates :password, length: { minimum: 6 }
   validates :password_confirmation, presence: true

   private
      def create_remember_token 
        self.remember_token = SecureRandom.urlsafe_base64
      end
end
