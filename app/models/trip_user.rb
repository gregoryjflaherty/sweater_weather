class TripUser < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  enum role: [:attendee, :manager, :owner]
  enum invite_status: [:unopened, :opened, :accepted, :rejected]
end
