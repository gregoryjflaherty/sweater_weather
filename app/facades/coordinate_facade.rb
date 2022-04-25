class CoordinateFacade
  def self.get_coordinates(location)
    data = CoordinateService.get_coordinates(location)
    Coordinate.new(data)
  end
end
