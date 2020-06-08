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
    coordinates = JSON.parse(response.body, symbolize_names: true)
    coordinates[:results][0][:geometry][:location].merge(location: coordinates[:results][0][:formatted_address])
  end

  def get_distance(starting, ending)
    response = connection.get("maps/api/directions/json?origin=#{starting}&destination=#{ending}&key=#{ENV['GOOGLE-DIRECTIONS-KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
