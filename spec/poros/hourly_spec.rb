require 'rails_helper'

RSpec.describe Hourly do
  before(:each) do
    data = {
      :dt=>1651057200,
      :temp=>58.15,
      :feels_like=>57.47,
      :pressure=>1014,
      :humidity=>81,
      :dew_point=>52.36,
      :uvi=>0,
      :clouds=>88,
      :visibility=>10000,
      :wind_speed=>4.65,
      :wind_deg=>210,
      :wind_gust=>5.46,
      :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
      :pop=>0
    }

    @hourly = Hourly.new(data)
  end

  it 'creates a hourly object' do
    expect(@hourly).to be_an_instance_of(Hourly)
    expect(@hourly.conditions).to eq("overcast clouds")
    expect(@hourly.icon).to eq("04n")
    expect(@hourly.min_temp).to eq(58.15)
    expect(@hourly.temperature).to eq(58.15)
    expect(@hourly.time).to eq("07:00:00")
  end
end
