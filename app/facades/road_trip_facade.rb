class RoadTripFacade
  def self.plan_trip(start_loc, end_loc)
    travel_hrs = get_travel_time(start_loc, end_loc)
    weather_at_eta = get_weather(end_loc, travel_hrs)
    RoadTrip.new(start_loc, end_loc, travel_time, weather_at_eta)
  end

  def self.get_travel_time(start_loc, end_loc)
    data = MapService.get_route(start_loc, end_loc)
    data[:route][:formattedTime]
  end

  def self.get_weather(end_loc, travel_hrs)
    coordinates = CoordinateFacade.get_coordinates(end_loc)
    forecast = ForecastService.get_forecast(coordinates)
    forecast[:hourly][(travel_hrs.to_i - 1)]
  end
end
