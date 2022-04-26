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
end
