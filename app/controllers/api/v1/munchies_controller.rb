class Api::V1::MunchiesController < ApplicationController
  def index
    coordinates = CoordinateFacade.get_coordinates(params[:destination])
    forecast = ForecastFacade.get_forecast(coordinates)
    data = MunchieFacade.get_munchie(params[:destination], params[:start], params[:food], forecast, coordinates)
    render json: MunchieSerializer.new(data)
    rescue StandardError
      bad_request
  end
end
