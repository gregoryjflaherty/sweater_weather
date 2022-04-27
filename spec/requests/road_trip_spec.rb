require 'rails_helper'
RSpec.describe 'Creates Road Trip Information' do
  scenario 'creates a road trip plan when correct information is passed', :vcr do
    VCR.use_cassette('la_to_miami') do
      @request_body = {
                        "origin": "Los Angeles, CA",
                        "destination": "Miami, FL",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post '/api/v1/road_trip', :params => @request_body, as: :json


      expected = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:data)

      expect(expected[:data].keys).to include(:id)
      expect(expected[:data][:id]).to eq('null')
      expect(expected[:data].keys).to include(:type)
      expect(expected[:data][:type]).to eq('roadtrip')

      expect(expected[:data].keys).to include(:attributes)
      expect(expected[:data][:attributes].keys).to include(:start_city)
      expect(expected[:data][:attributes].keys).to include(:end_city)
      expect(expected[:data][:attributes].keys).to include(:travel_time)
      expect(expected[:data][:attributes].keys).to include(:weather_at_eta)

      expect(expected[:data][:attributes][:start_city]).to be_a String
      expect(expected[:data][:attributes][:start_city]).to eq('Los Angeles, CA')
      expect(expected[:data][:attributes][:end_city]).to be_a String
      expect(expected[:data][:attributes][:end_city]).to eq('Miami, FL')
      expect(expected[:data][:attributes][:travel_time]).to be_a String

      expect(expected[:data][:attributes][:weather_at_eta]).to be_a Hash
      expect(expected[:data][:attributes][:weather_at_eta].length).to eq(2)
      expect(expected[:data][:attributes][:weather_at_eta].keys).to include(:temperature)
      expect(expected[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
      expect(expected[:data][:attributes][:weather_at_eta].keys).to include(:conditions)
      expect(expected[:data][:attributes][:weather_at_eta][:conditions]).to be_a String



      expect(expected[:data].length).to eq(3)
      expect(expected[:data][:attributes].length).to eq(4)
      expect(expected[:data][:attributes].keys).to_not include(:current_weather)
    end
  end

  scenario 'creates an impossible road trip plan if route is over seas', :vcr do
    VCR.use_cassette('sd_to_london') do
      @request_body = {
                        "origin": "San Diego, CA",
                        "destination": "London, UK",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post '/api/v1/road_trip', :params => @request_body, as: :json


      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:data)

      expect(expected[:data].keys).to include(:id)
      expect(expected[:data][:id]).to eq('null')
      expect(expected[:data].keys).to include(:type)
      expect(expected[:data][:type]).to eq('roadtrip')

      expect(expected[:data].keys).to include(:attributes)
      expect(expected[:data][:attributes].keys).to include(:start_city)
      expect(expected[:data][:attributes].keys).to include(:end_city)
      expect(expected[:data][:attributes].keys).to include(:travel_time)
      expect(expected[:data][:attributes].keys).to include(:weather_at_eta)

      expect(expected[:data][:attributes][:travel_time]).to eq('impossible')
      expect(expected[:data][:attributes][:weather_at_eta]).to eq(nil)
    end
  end

  context 'Sad Path' do
    scenario 'returns error if origin city is missing', :vcr do
      @request_body = {
                        "destination": "Miami, FL",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post '/api/v1/road_trip', :params => @request_body, as: :json
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message]).to eq("Incomplete request body, include all requirements")
    end

    scenario 'returns error if desitination city is missing', :vcr do
      @request_body = {
                        "origin": "Los Angeles, CA",
                        "api_key": "jgn983hy48thw9begh98h4539h4"
                      }

      post '/api/v1/road_trip', :params => @request_body, as: :json
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message]).to eq("Incomplete request body, include all requirements")
    end

    scenario 'returns error if api_key is missing', :vcr do
      @request_body = {
                        "origin": "Los Angeles, CA",
                        "destination": "Miami, FL"
                      }

      post '/api/v1/road_trip', :params => @request_body, as: :json
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message]).to eq("Missing API Key")
    end

    scenario 'returns error if request not sent in body', :vcr do

      post "/api/v1/road_trip?origin=San Diego&destination=Los Angeles&api_key=jgn983hy48thw9begh98h4539h4"

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(expected.keys.length).to eq(1)
      expect(expected.keys[0]).to eq(:message)
      expect(expected.keys[0]).to_not eq(:data)

      expect(expected[:message]).to eq("Request must be sent in body")
    end
  end
end
