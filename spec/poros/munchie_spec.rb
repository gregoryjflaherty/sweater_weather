require 'rails_helper'

RSpec.describe Munchie do
  it 'creates a munchie object' do
    response1 = File.read('spec/fixtures/san_diego_to_los_angeles.json')
    route = JSON.parse(response1, symbolize_names: true)

    response2 = File.read('spec/fixtures/food_data.json')
    food_data = JSON.parse(response2, symbolize_names: true)

    response3 = File.read('spec/fixtures/random_weather.json')
    forecast_data = JSON.parse(response3, symbolize_names: true)
    forecast = Forecast.new(forecast_data)

    response4 = File.read('spec/fixtures/coordinate_call.json')
    coordinate_data = JSON.parse(response4, symbolize_names: true)
    coordinates = Coordinate.new(coordinate_data)

    object = Munchie.new(route, food_data, forecast, coordinates)

    expect(object).to be_an_instance_of(Munchie)
    expect(object.destination_city).to be_a String

    expect(object.forecast).to be_a Hash
    expect(object.forecast.keys).to include(:summary)
    expect(object.forecast.keys).to include(:temperature)
    expect(object.forecast[:temperature]).to be_a Float
    expect(object.forecast[:summary]).to be_a String

    expect(object.restaurant).to be_a Hash
    expect(object.restaurant.keys).to include(:name)
    expect(object.restaurant.keys).to include(:address)
    expect(object.restaurant[:name]).to be_a String
    expect(object.restaurant[:address]).to be_a String

    expect(object.travel_time).to be_a String
  end
end
