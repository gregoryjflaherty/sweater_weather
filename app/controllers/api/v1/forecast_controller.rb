class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = CoordinateFacade.get_coordinates(params[:location])
    data = ForecastFacade.get_forecast(coordinates)
    render json: ForecastSerializer.new(data)
    rescue StandardError
      bad_request
  end
end
