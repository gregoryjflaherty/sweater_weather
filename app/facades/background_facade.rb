class BackgroundFacade
  def self.get_image(location)
    data = BackgroundService.get_image(location)
    Photo.new(data.photos[0], location)
  end
end
