require 'rails_helper'

RSpec.describe "Background Facade" do
  scenario 'returns object when calling background facade' do
    VCR.use_cassette('la_photos') do
      photo = BackgroundFacade.get_image("Los Angeles")

      expect(photo).to be_an_instance_of Photo
    end
  end
end
