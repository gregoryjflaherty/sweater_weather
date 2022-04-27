require 'rails_helper'

RSpec.describe BackgroundService do
  it 'returns an array of images' do
    response = BackgroundService.get_image('Key West')

    expect(response.photos.length).to eq(15)
  end

  it 'retruns a user for each image' do
    response = BackgroundService.get_image('Key West')

    expect(response.photos[0].user.name).to eq("Nextvoyage")
  end

  it 'retruns an image' do
    response = BackgroundService.get_image('Key West')

    expect(response.photos[0].src['original']).to eq("https://images.pexels.com/photos/2225499/pexels-photo-2225499.jpeg")
  end
end
