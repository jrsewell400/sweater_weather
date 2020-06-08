class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  
  has_secure_password
  has_secure_token :api_key
end
