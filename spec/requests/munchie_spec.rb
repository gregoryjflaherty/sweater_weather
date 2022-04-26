require 'rails_helper'

RSpec.describe 'Search Munchie Route' do
  scenario 'detailed route with restaurant', :vcr do
    get "http://localhost:3000/api/v1/munchies?start=San Diego&destination=Los Angeles&food=chinese"
    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected[:data][:attributes].keys).to include(:destination_city)
    expect(expected[:data][:attributes].keys).to include(:travel_time)
    expect(expected[:data][:attributes].keys).to include(:forecast)
    expect(expected[:data][:attributes].keys).to include(:restaurant)

    expect(expected[:data][:attributes][:restaurant].keys).to include(:name)
    expect(expected[:data][:attributes][:restaurant].keys).to include(:address)

    expect(expected[:data][:attributes][:forecast].keys).to include(:summary)
    expect(expected[:data][:attributes][:forecast].keys).to include(:temperature)
  end

  context 'Sad Path' do
    scenario 'catches bad request error if parameters are incorrect', :vcr do
      get "http://localhost:3000/api/v1/munchies?start=105251&destination=87878&food=chinese"
      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(expected[:data]).to be(nil)

      expect(expected[:message]).to eq("Request Invalid: Please check paramters and try again")
    end
  end
end
