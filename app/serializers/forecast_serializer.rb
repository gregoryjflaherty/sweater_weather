class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather, :daily_weather, :hourly_weather
  set_id { :null }
  set_type 'forecast'
end
