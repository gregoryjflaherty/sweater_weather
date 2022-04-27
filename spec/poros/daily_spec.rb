require 'rails_helper'

RSpec.describe Hourly do
  before(:each) do
    data = {:dt=>1651086000,
      :sunrise=>1651064721,
      :sunset=>1651112814,
      :moonrise=>1651059480,
      :moonset=>1651102800,
      :moon_phase=>0.9,
      :temp=>{:day=>63.48, :min=>57.94, :max=>64.08, :night=>58.98, :eve=>61.95, :morn=>58.15},
      :feels_like=>{:day=>62.44, :night=>58.15, :eve=>60.94, :morn=>57.43},
      :pressure=>1016,
      :humidity=>62,
      :dew_point=>49.28,
      :wind_speed=>9.98,
      :wind_deg=>240,
      :wind_gust=>8.68,
      :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
      :clouds=>4,
      :pop=>0,
      :uvi=>7.89}

    @daily = Daily.new(data)
  end

  it 'creates a daily object' do
    expect(@daily).to be_an_instance_of(Daily)
    expect(@daily.conditions).to eq("clear sky")
    expect(@daily.icon).to eq("01d")
    expect(@daily.max_temp).to eq(64.08)
    expect(@daily.min_temp).to eq(57.94)
  end
end
