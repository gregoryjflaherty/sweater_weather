require 'rails_helper'
RSpec.describe 'Search Forecast' do
  scenario 'retrieves forecast for city that is searched' do
    VCR.use_cassette('san_diego_forcast') do
      params = {location: 'San Diego'}
      get api_v1_forecast_index_path, params: params

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(expected[:data][:attributes].keys).to include(:current_weather)
      expect(expected[:data][:attributes].keys).to include(:daily_weather)
      expect(expected[:data][:attributes].keys).to include(:hourly_weather)
    end
  end
end
