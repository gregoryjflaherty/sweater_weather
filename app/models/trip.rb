class Trip < ApplicationRecord
    has_many :trip_users
    has_many :users, through: :trip_users
end
