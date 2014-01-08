class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  #valid name
  validates :name, presence: true, length: {maximum: 20}
  #valid email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #secure password
  has_secure_password
  validates :password, length: { minimum: 6 }
end
