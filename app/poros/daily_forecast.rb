class DailyForecast
  def initialize(weather_info)
    @day = Time.at(weather_info[:dt]).strftime('%A')
    @icon = weather_info[:weather][0][:icon]
    @summary = weather_info[:weather][0][:main]
    @high = convert_temp(weather_info[:temp][:max]).round
    @low = convert_temp(weather_info[:temp][:min]).round
  end

  def convert_temp(temp)
    (temp - 273.15) * 1.8 + 32
  end
end
