class Api::V2::RequestsController < ApplicationController
  before_action :is_owner?, except: [:index]

  def index
  end

  def show
  end

  def create
  end

  def create
  end

  def destory
  end

  private

  def is_owner?
    render json: {message: "You must be an owner or manager to edit a trip"}, status: 401
  end
end
