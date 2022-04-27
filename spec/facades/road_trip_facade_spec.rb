require 'rails_helper'

RSpec.describe "Road Trip Facade" do
  scenario 'returns object when calling road trip facade', :vcr do
    road_trip = RoadTripFacade.plan_trip("Los Angeles, CA", "Miami, FL")
    expect(road_trip).to be_an_instance_of RoadTrip
  end

  scenario 'returns travel time', :vcr do
    time = RoadTripFacade.get_travel_time("Los Angeles, CA", "Miami, FL")
    expect(time).to eq("38:58:34")
  end

  scenario 'weather at eta', :vcr do
    time = RoadTripFacade.get_travel_time("Los Angeles, CA", "Miami, FL")
    weather = RoadTripFacade.get_weather("Miami, FL", time)

    expect(weather).to be_a Hash
    expect(weather[:weather][0][:description]).to be_a String
  end
end
