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

  context 'Sad Path' do
    scenario 'returns error if paramters bad or incomplete', :vcr do

      params = {location: ""}
      get api_v1_forecast_index_path, params: params

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message]).to eq("Request Invalid: Please check paramters and try again")
    end

    scenario 'returns error if paramters bad or incomplete', :vcr do

      params = {location: 456}
      get api_v1_forecast_index_path, params: params

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message]).to eq("Request Invalid: Please check paramters and try again")
    end
  end
end
