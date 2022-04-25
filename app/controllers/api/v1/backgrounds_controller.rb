class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundFacade.get_image(params[:location])
    render json: BackgroundSerializer.new(image)
  rescue StandardError
    bad_request
  end
end
