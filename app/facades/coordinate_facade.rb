class CoordinateFacade
  def self.get_coordinates(location)
    data = MapService.get_coordinates(location)
    Coordinate.new(data)
  end
end
