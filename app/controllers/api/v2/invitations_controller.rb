class Api::V2::InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_trip_user, except: [:index] 

  def index
    if params[:sort] == 'incoming'
      render json: current_user.incoming_invites, status: 200
    elsif params[:sort] == 'outgoing'
      render json: TripUser.outgoing_invites(current_user.id), status: 200
    else
      render json: {message: "Please sort by incoming or outgoing"}, status: 400
    end
  end

  def show
    @invitation.update!(invite_status: 1)
    render json: @invitation, status: 200
  end
  
  def update
    if params[:accept].downcase == 'true'
      @invitation.update!(invite_status: 2)
      render json: @invitation, status: 204
    elsif params[:accept].downcase == 'false'
      @invitation.update!(invite_status: 3)
      render json: @invitation, status: 204
    else
      render json: {message: "Please choose true or false"}, status: 400
    end
  end

  def create
    if @invitation.role == 'owner'
      invitation =  InvitationSender.new(params)
      render json: invitation, status: 201
    else
      render json: {message: "You must be an owner to send invitations"}, status: 401 
    end 
  end

  def find_trip_user
    @invitation = TripUser.find_by(id: params[:id])
    if !@invitation
      render json: {message: "Request ID not found"}, status: 404
    end
  end 
end
