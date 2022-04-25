class MunchieFacade
  def self.get_munchie(destination, start, food_type, forecast, coordinates)
    route = MapService.get_route(start, destination)
    food_data = MunchieService.get_restaurant(food_type, destination, get_arrival_time(route))
    Munchie.new(route, food_data, forecast, coordinates)
  end

  def self.get_arrival_time(route)
    time_array = route[:route][:formattedTime].split("")
    hours = time_array[0] + time_array[1]
    minutes = time_array[3] + time_array[4]
    t2 = Time.now + (hours.to_i * 60 * 60)
    (t2 + (minutes.to_i * 60)).to_time.to_i
  end
end
