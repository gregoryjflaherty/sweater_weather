require 'rails_helper'

RSpec.describe Photo do

  it 'creates a photo object' do
    data = BackgroundService.get_image("Los Angeles")
    object = Photo.new(data.photos[0], "Los Angeles")

    expect(object).to be_an_instance_of(Photo)
    expect(object.credit).to be_a Hash
    expect(object.credit[:source]).to eq("pexels.com")
    expect(object.credit[:author]).to eq("Roberto Nickson")
    expect(object.credit[:logo]).to eq("https://images.pexels.com/lib/api/pexels-white.png")

    expect(object.image[:location]).to eq("Los Angeles")
    expect(object.image[:image_url]).to eq("https://www.pexels.com/photo/city-near-mountain-during-golden-hour-2525903/")
  end
end
