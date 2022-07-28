require 'rails_helper'

RSpec.describe 'Search Image' do
  scenario 'retrieves image for city that is searched', :vcr do
    VCR.use_cassette('san_diego_image') do
      params = {location: 'San Diego'}
      get api_v1_backgrounds_path, params: params

      expected = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(expected[:data][:attributes].keys).to include(:image)
      expect(expected[:data][:attributes].keys).to include(:credit)
    end
  end

  scenario 'returns error if paramters bad or incomplete', :vcr do

    params = {location: ""}
    get api_v1_backgrounds_path, params: params

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(expected.keys.length).to eq(1)
    expect(expected.keys[0]).to eq(:message)
    expect(expected.keys[0]).to_not eq(:data)

    expect(expected[:message]).to eq("Request Invalid: Please check paramters and try again")
  end

  scenario 'returns error if numbers passed', :vcr do

    params = {location: 99999}
    get api_v1_backgrounds_path, params: params

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(expected.keys.length).to eq(1)
    expect(expected.keys[0]).to eq(:message)
    expect(expected.keys[0]).to_not eq(:data)

    expect(expected[:message]).to eq("Request Invalid: Please check paramters and try again")
  end
end
