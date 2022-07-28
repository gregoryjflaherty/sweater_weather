class ForecastFacade
  def self.get_forecast(coordinates)
    data = ForecastService.get_forecast(coordinates)
    Forecast.new(data)
  end
end
