class BackgroundService

  def self.get_image(location)
    client = Pexels::Client.new(ENV['pexels_key'])
    client.photos.search(location)
  end

end
