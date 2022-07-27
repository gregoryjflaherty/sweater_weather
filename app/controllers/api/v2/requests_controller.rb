class Api::V2::RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_trip_user, only: [:show, :update] 

  def index
    if params[:sort] == 'incoming'
      render json: current_user.incoming_requests, status: 200
    elsif params[:sort] == 'outgoing'
      render json: current_user.sent_requests, status: 200
    else
      render json: {message: "Please sort by incoming or outgoing"}, status: 400
    end
  end

  def show
    @request.update!(invite_status: 1)
    render json: @request, status: 200
  end
  
  def update
    if params[:accept].downcase == 'true'
      @request.update!(invite_status: 2)
      render json: @request, status: 200
    elsif params[:accept].downcase == 'false'
      @request.update!(invite_status: 3)
      render json: @request, status: 200
    else
      render json: {message: "Please choose true or false"}, status: 400
    end
  end

  def create
    require 'pry'; binding.pry
    request = TripUser.create!(
      trip_id: Trip.find_by(params[:trip_id]).id,
      user_id: User.find_by(id: params[:recipient_id]).id,
      role: params[:role],
      invite_status: 0)

    render json: request, status: 201
  end

  private

  def is_owner?
    render json: {message: "You must be an owner or manager to edit a trip"}, status: 401
  end

  def find_trip_user
    @request = TripUser.find_by(id: params[:id])
    if !@request
      render json: {message: "Request ID not found"}, status: 404
    end
  end 
end
