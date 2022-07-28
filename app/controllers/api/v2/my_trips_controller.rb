class Api::V2::MyTripsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        render json: current_user.trip_users, status: 200
    end


    def create
        my_trip = TripCreator.new(params, current_user)
        render json: my_trip, status: 201
    end
end