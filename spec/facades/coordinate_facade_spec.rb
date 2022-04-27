require 'rails_helper'

RSpec.describe "Coordinate Facade" do
  scenario 'returns object when calling coordinate facade' do
    VCR.use_cassette('coordinate_call') do
      coordinate = CoordinateFacade.get_coordinates("Los Angeles")

      expect(coordinate).to be_an_instance_of Coordinate
    end
  end
end
