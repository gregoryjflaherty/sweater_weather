class MapService
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

  def self.get_route(start_loc, end_loc)
    response = conn.get('/directions/v2/route') do |req|
      req.params['key'] = ENV['map_quest_key']
      req.params['from'] = start_loc
      req.params['to'] = end_loc
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
