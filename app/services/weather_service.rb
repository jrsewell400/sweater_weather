class WeatherService
  def connection
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5') do |f|
      f.params['appid'] = ENV['WEATHER-API-KEY']
    end
  end

  def weather_data(lat, long)
    response = connection.get("onecall?lat=#{lat}&lon=#{long}&appid=#{ENV['WEATHER-API-KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
