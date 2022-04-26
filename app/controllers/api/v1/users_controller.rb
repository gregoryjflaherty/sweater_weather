class Api::V1::UsersController < ApplicationController
  before_action :check_body, only: [:create]

  def create
    user = create_user
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {message: user.errors.full_messages}, status: 422
    end
  end

  private

  def check_body
    if params[:user].nil?
      render json: {message: "Request must be sent in body"}, status: 400
    end
  end

  def create_user
    User.create(
    email: params['email'],
    password: params['password'],
    password_confirmation: params['password_confirmation'])
  end
end
