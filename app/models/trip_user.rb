class TripUser < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  enum role: [:attendee, :manager, :owner]
  enum invite_status: [:unopened, :opened, :accepted, :rejected]

  def self.outgoing_invites(user_id)
    self.where(trip_id: TripUser.select("trip_id")
        .where(role: 'owner').where(user_id: user_id))
        .where.not(role: 'owner').order(:invite_status)
  end 
end
