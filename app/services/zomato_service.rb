class ZomatoService
  def connection
    Faraday.new(url: 'https://developers.zomato.com/api/v2.1') do |f|
      f.params['apikey'] = ENV['ZOMATO-API-KEY']
    end
  end

  def get_restaraunt(lat, long, cuisine)
    response = connection.get("search?lat=#{lat}&lon=#{long}&cuisines=#{cuisine}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
