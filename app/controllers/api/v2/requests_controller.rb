class Api::V2::RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:sort] = 'incoming'
      render json: current_user.incoming_requests, status: 200
    elsif params[:sort] = 'outgoing'
      render json: current_user.sent_requests, status: 200
    else
      render json: {message: "Please sort by incoming or outgoing"}, status: 400
    end
  end

  def show
    request = TripUser.find_by(id: params[:id])
    if request
      request.update!(invite_status: 1)
      render json: request, status: 200
    else 
      render json: {message: "Request ID not found"}, status: 404
    end 
  end

  def update
    require 'pry'; binding.pry
  end

  def create
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
end
