class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  validates_presence_of :email
  validates_uniqueness_of :email


  has_many :trip_users
  has_many :trips, through: :trip_users
end
