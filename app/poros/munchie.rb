class Munchie
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(route, food_data, forecast, coordinates)
    @destination_city = coordinates.location
    @travel_time = format_time(route[:route][:formattedTime])
    @forecast = {
      'summary': forecast.current_weather.conditions,
      'temperature': forecast.current_weather.temp
    }
    @restaurant = {
      'name': food_data[:businesses][0][:name],
      'address': format_address(food_data[:businesses][0][:location][:display_address])
    }
  end

  def format_time(time)
    str = ""
    time.split("").each_with_index do |char, idx|
      if idx == 0 && char != "0"
        str << char
      elsif idx == 1
        str << char
      elsif idx == 3
        str << ' hour(s) '
        str << char
      elsif  idx == 4
        str << char
        str << ' minute(s) '
      end
    end
    str
  end

  def format_address(address_array)
    str = ''
    address_array.each_with_index do |element, idx|
      str << element
      str << ' ,' unless idx == (address_array.length - 1)
    end
    str
  end
end
