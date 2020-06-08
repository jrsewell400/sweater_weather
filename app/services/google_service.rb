class GoogleService
  def connection
    Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.params['key'] = ENV['SWG_KEY']
    end
  end

  def get_geocode(location)
    response = connection.get('maps/api/geocode/json') do |req|
      req.params['address'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
