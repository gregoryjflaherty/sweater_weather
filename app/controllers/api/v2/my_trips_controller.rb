class Api::V2::MyTripsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        render json: current_user.trip_users, status: 200
    end


    def create
        trip = Trip.create!(
            start_loc: params[:data][:attributes][:start_city],
            end_loc: params[:data][:attributes][:end_city],
            travel_time: params[:data][:attributes][:travel_time])
        
        my_trip = trip.trip_users.create!(
            user_id: current_user.id,
            trip_id: trip.id,
            role: 2,
            invite_status: nil
        )

        render json: my_trip, status: 201
    end
end