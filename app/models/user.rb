class User < ApplicationRecord
  validates_presence_of :username, :password_digest
  has_many :favourites
  has_secure_password
end
