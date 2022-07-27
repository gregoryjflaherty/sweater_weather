class Api::V2::SessionsController < ApplicationController
    before_action :check_body, only: [:create]
    before_action :find_user 
    before_action :authorize, only: [:destroy]

  def create
    if @user.nil?
      render json: {message: "Password/Email combination does not match"}, status: 422
    elsif @user.authenticate(params[:password]) != @user
      render json: {message: "Password/Email combination does not match"}, status: 422
    else
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user), status: 200
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "#{@user.email} has been logged out"}, status: 200
  end

  private

  def check_body
    if params[:session].nil?
      render json: {message: "Request must be sent in body"}, status: 400
    end
  end

  def find_user
    @user = User.find_by(email: (params[:email]))
  end
end
