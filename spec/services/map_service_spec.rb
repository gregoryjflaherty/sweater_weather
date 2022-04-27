require 'rails_helper'

RSpec.describe MapService do
  scenario 'it returns coordinates', :vcr do
    VCR.use_cassette("san_diego_forecast") do
      response = MapService.get_coordinates("San Diego, CA")

      expect(response[:results][0][:providedLocation][:location]).to eq("San Diego, CA")
      expect(response[:results][0][:locations][0][:adminArea5]).to eq("San Diego")
      expect(response[:results][0][:locations][0][:adminArea3]).to eq("CA")

      expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(32.71576)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-117.163817)
    end
  end

  context "Sad Path" do
    scenario 'returns error if no location is passed', :vcr do
      response = MapService.get_coordinates("")

      expect(response[:info][:statuscode]).to eq(400)
      expect(response[:info][:messages][0]).to eq("Illegal argument from request: Insufficient info for location")
    end
  end

  scenario 'it returns route', :vcr do
    VCR.use_cassette("sd_miami") do
      response = MapService.get_route("San Diego, CA", "Miami, FL")

      expect(response[:route][:formattedTime]).to eq("37:43:27")
      expect(response[:route][:fuelUsed]).to eq(135.74)
    end
  end

  context "Sad Path" do
    scenario 'returns error if incomplete information is passed', :vcr do
      response = MapService.get_route("San Diego, CA", 12347)

      expect(response[:info][:statuscode]).to eq(402)
      expect(response[:info][:messages][0]).to eq("We are unable to route with the given locations.")
    end

    scenario 'tells you if route is impossible', :vcr do
      response = MapService.get_route("San Diego, CA", "London, UK")

      expect(response[:info][:statuscode]).to eq(402)
      expect(response[:info][:messages][0]).to eq("We are unable to route with the given locations.")
    end
  end
end
