require 'rails_helper'

RSpec.describe "Forecast Facade" do
  scenario 'returns object when calling forecast facade' do
    VCR.use_cassette('key_largo_forecast') do
      coordinate = CoordinateFacade.get_coordinates("Key Largo")
      forecast = ForecastFacade.get_forecast(coordinate)

      expect(forecast).to be_an_instance_of Forecast
    end
  end
end
