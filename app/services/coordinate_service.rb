class CoordinateService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/')
  end

  def self.get_coordinates(location)
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['key'] = ENV['map_quest_key']
      req.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
