class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = CoordinateFacade.get_coordinates(params[:location])
    forecast = ForecastFacade.get_forecast(coordinates)
    render json: forecast, status: 200
    rescue StandardError
      bad_request
  end
end