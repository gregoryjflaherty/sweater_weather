class Photo
  attr_reader :image,
              :credit

  def initialize(data, location)
    @image = {
      location: location,
      image_url: data.url
    }
    @credit = {
      source: 'pexels.com',
      author: data.user.name,
      logo: 'https://images.pexels.com/lib/api/pexels-white.png'
    }
  end
end
