require 'rails_helper'

RSpec.describe Current do
  before(:each) do
    data = {
             :dt=>1651060336,
             :sunrise=>1651064721,
             :sunset=>1651112814,
             :temp=>57.94,
             :feels_like=>57.29,
             :pressure=>1014,
             :humidity=>82,
             :dew_point=>52.48,
             :uvi=>0,
             :clouds=>100,
             :visibility=>10000,
             :wind_speed=>11.01,
             :wind_deg=>108,
             :wind_gust=>13,
             :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}]
           }

    @current = Current.new(data)
  end

  it 'creates a daily object' do

    expect(@current).to be_an_instance_of(Current)
    expect(@current.conditions).to eq("overcast clouds")
    expect(@current.icon).to eq("04n")
    expect(@current.datetime).to be_an_instance_of(Time)
    expect(@current.sunrise).to be_an_instance_of(Time)
    expect(@current.sunset).to be_an_instance_of(Time)
    expect(@current.temp).to eq(57.94)
  end
end
