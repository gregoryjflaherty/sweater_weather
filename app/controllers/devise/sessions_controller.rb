class Devise::SessionsController < ApplicationController
  before_action :find_user 

  def new
    render json: {message: "Invalid Token"}, status: 401
  end

    def create
    if @user && @user.valid_password?(params[:password])
      render json: @user.as_json(only: [:id, :email, :authentication_token]), status: 201
    else 
      render json: {message: "Password/Email combination does not match"}, status: 401
    end 
  end
  
  def destroy
    current_user&.authentication_token = nil
    if current_user.save
      render json: {message: "Successful sign out"}, status: 200
    else
      head(:unauthorized)
    end 
  end

  private
  
  def find_user
    @user = User.find_by(email: (params[:email]))
  end
end
