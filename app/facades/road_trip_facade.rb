class RoadTripFacade
  def self.plan_trip(start_loc, end_loc)
    travel_time = get_travel_time(start_loc, end_loc)
    weather = get_weather(end_loc, travel_time)
    RoadTrip.new(start_loc, end_loc, travel_time, weather)
  end

  def self.get_travel_time(start_loc, end_loc)
    data = MapService.get_route(start_loc, end_loc)
    data[:route][:formattedTime]
  end

  def self.get_weather(end_loc, travel_time)
    eta = (Time.now + travel_time.to_i.hours).to_time.to_i
    coordinates = CoordinateFacade.get_coordinates(end_loc)
    forecast = ForecastService.get_forecast(coordinates)
    forecast[:hourly][(travel_time.to_i - 1)]
  end
end
