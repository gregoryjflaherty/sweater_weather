class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :trip_users
  has_many :trips, through: :trip_users

  def incoming_invites
    trip_users.where.not(role: 'owner')
              .where.not(invite_status: ['accepted', 'rejected'])
              .order(:invite_status)
  end   
end
