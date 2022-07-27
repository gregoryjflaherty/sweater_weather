class Api::V2::FavoritesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        # require 'pry'; binding.pry
        render json: {message: "Works"}
    end

    def show
    end

    def create
        @trip = Trip.create!(
            start_loc: params[:data][:attributes][:start_city],
            end_loc: params[:data][:attributes][:end_city],
            travel_time: params[:data][:attributes][:travel_time])
        
        @trip.trip_users.create!(
            user_id: 1,
            trip_id: @trip.id,
            role: 0,
            invite_status: nil
        )
    end

    def destory
    end
end