class HourlyForecast
  def initialize(hourly_info)
    @time = Time.at(hourly_info[:dt]).strftime("%-l%p")
    @icon = hourly_info[:weather][0][:icon]
    @temp = convert_temp(hourly_info[:temp]).round
  end

  def convert_temp(temp)
    (temp - 273.15) * 1.8 + 32
  end
end
