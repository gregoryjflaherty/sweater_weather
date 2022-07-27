class Coordinate
  attr_reader :street, :city, :country, :latitude, :longitude

  def initialize(data)
    @street = data[:results][0][:locations][0][:street]
    @city = data[:results][0][:locations][0][:adminArea5] 
    @country = data[:results][0][:locations][0][:adminArea1] 
    @latitude = data[:results][0][:locations][0][:latLng][:lat]
    @longitude = data[:results][0][:locations][0][:latLng][:lng]
  end
end
