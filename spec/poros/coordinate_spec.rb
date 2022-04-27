require 'rails_helper'

RSpec.describe Coordinate do
  it 'creates a coordinate object' do
    response = File.read('spec/fixtures/vcr_cassettes/coordinate_call.json')
    data = JSON.parse(response, symbolize_names: true)
    object = Coordinate.new(data)

    expect(object).to be_an_instance_of(Coordinate)
    expect(object.longitude).to eq(-117.163817)
    expect(object.latitude).to eq(32.71576)
  end
end
