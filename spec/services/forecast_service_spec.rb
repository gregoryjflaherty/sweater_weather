require 'rails_helper'

RSpec.describe ForecastService do
  scenario 'it returns proper data from weather service', :vcr do
    VCR.use_cassette("key_largo_forecast") do
      data = MapService.get_coordinates("Key Largo")
      coordinate = Coordinate.new(data)
      response = ForecastService.get_forecast(coordinate)

      expect(response[:current].keys).to include(:dt)
      expect(response[:current].keys).to include(:sunrise)
      expect(response[:current].keys).to include(:temp)
      expect(response[:current].keys).to include(:weather)
      expect(response[:current][:weather][0].keys).to include(:description)
      expect(response[:current][:weather][0].keys).to include(:icon)
    end
  end
end
