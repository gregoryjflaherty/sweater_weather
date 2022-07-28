class Api::V1::RoadTripController < ApplicationController
  before_action :check_body, only: [:create]

  def create
    data = RoadTripFacade.plan_trip(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(data)
  end

  private

  def check_body
    if params[:road_trip].nil?
      render json: {message: "Request must be sent in body"}, status: 400
    elsif params[:origin].nil? || params[:destination].nil?
      render json: {message: "Incomplete request body, include all requirements"}, status: 400
    end
  end
end
