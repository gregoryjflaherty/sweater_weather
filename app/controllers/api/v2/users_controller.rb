class Api::V2::UsersController < ApplicationController
  
  def create
    user = create_user
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {message: user.errors.full_messages}, status: 422
    end
  end

  private

  def create_user
    User.create(
    email: params['email'],
    password: params['password'],
    password_confirmation: params['password_confirmation'])
  end
end
