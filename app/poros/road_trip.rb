class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_loc, end_loc, travel_time, weather)
    @start_city = start_loc
    @end_city = end_loc
    @travel_time = set_travel_time(travel_time)
    @weather_at_eta = set_weather(travel_time, weather)
  end

  def set_travel_time(travel_time)
    travel_time.nil? ? 'impossible' : travel_time
  end

  def set_weather(travel_time, weather)
    if travel_time.nil?
    else
      {
        temperature: weather[:temp],
        conditions: weather[:weather][0][:description]
      }
    end
  end
end
