class Coordinate
  attr_reader :location, :latitude, :longitude

  def initialize(data)
    @location = "#{data[:results][0][:locations][0][:adminArea5]}, #{data[:results][0][:locations][0][:adminArea3]}"
    @latitude = data[:results][0][:locations][0][:latLng][:lat]
    @longitude = data[:results][0][:locations][0][:latLng][:lng]
  end
end
