class ForecastService
  def self.conn
    Faraday.new(url: 'http://api.openweathermap.org/')
  end

  def self.get_forecast(coordinates)
    response = conn.get('/data/2.5/onecall') do |req|
      req.params['lat'] = coordinates.latitude
      req.params['lon'] = coordinates.longitude
      req.params['exclude'] = 'minutely, alerts'
      req.params['units'] = 'imperial'
      req.params['appid'] = ENV['open_weather_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
