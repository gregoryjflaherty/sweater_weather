class MunchieService
  def self.conn
    Faraday.new(url: 'https://api.yelp.com/',
      headers: {
    'Authorization': "Bearer #{ENV['yelp_key']}"
  })
  end

  def self.get_restaurant(type, destination, arrival_time)
    response = conn.get('/v3/businesses/search') do |req|
      req.params['categories'] = type
      req.params['location'] = destination
      req.params['open_at'] = arrival_time
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
