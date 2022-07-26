class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password
  has_secure_token :api_key

  has_many :trip_users
  has_many :trips, through: :trip_users
end
