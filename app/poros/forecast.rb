class Forecast
  attr_reader :street, :city, :country, :current_weather, :daily_weather, :hourly_weather

  def initialize(data, coordinates)
    @street = coordinates.street
    @city = coordinates.city
    @country = coordinates.country
    @current_weather = Current.new(data[:current])
    @daily_weather = get_daily(data[:daily])
    @hourly_weather = get_hourly(data[:hourly])
  end

  def get_daily(data)
    data[0..4].map {|day_data| Daily.new(day_data)}
  end

  def get_hourly(data)
    data[0..7].map {|hour_data| Hourly.new(hour_data)}
  end
end