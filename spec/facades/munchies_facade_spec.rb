require 'rails_helper'

RSpec.describe 'Munchie Facade' do
  it 'calculates arrival time' do
    response = File.read('spec/fixtures/san_diego_to_los_angeles.json')
    route = JSON.parse(response, symbolize_names: true)

    time_of_arrival = MunchieFacade.get_arrival_time(route)

  end
end
