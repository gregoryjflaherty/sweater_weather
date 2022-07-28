require 'rails_helper'

RSpec.describe Forecast do

  it 'creates a forecast object' do
    response = File.read('spec/fixtures/vcr_cassettes/key_west_forecast.json')
    data = JSON.parse(response, symbolize_names: true)
    CoordinateData = Struct.new(:street, :city, :country)
    coordinates = CoordinateData.new("street", "city", "country")
    object = Forecast.new(data, coordinates)

    expect(object).to be_an_instance_of(Forecast)

    expect(object.current_weather).to be_an_instance_of(Current)

    expect(object.daily_weather).to be_a Array
    expect(object.daily_weather.length).to eq(5)
    object.daily_weather.each do |daily|
      expect(daily).to be_an_instance_of Daily
    end

    expect(object.hourly_weather).to be_a Array
    expect(object.hourly_weather.length).to eq(8)
    object.hourly_weather.each do |hourly|
      expect(hourly).to be_an_instance_of Hourly
    end
  end
end
