class Api::V1::SessionsController < ApplicationController
    before_action :check_body, only: [:create]

  def create
    user = User.find_by(email: (params[:email]))
    if user.nil?
      render json: {message: "Password/Email combination does not match"}, status: 422
    elsif user.authenticate(params[:password]) != user
      render json: {message: "Password/Email combination does not match"}, status: 422
    else
      render json: UserSerializer.new(user), status: 200
    end
  end

  private

  def check_body
    if params[:session].nil?
      render json: {message: "Request must be sent in body"}, status: 400
    end
  end
end
