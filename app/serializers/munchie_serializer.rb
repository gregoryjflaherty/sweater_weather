class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination_city, :travel_time, :forecast, :restaurant
  set_id { :null }
  set_type 'munchie'
end
