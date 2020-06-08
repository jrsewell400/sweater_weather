class ForecastData
   attr_reader :id,
               :city,
               :state,
               :country,
               :time,
               :timezone_offset,
               :timezone,
               :current,
               :current_high,
               :current_low,
               :summary,
               :icon,
               :feels_like,
               :humidity,
               :visibility,
               :uv_index,
               :uv_category,
               :sunrise,
               :sunset,
               :hourly_forecasts,
               :daily_forecasts

  def initialize(location_info, weather_info)
    @id = nil
    @city = location_info[:results][0][:address_components][0][:long_name]
    @state = location_info[:results][0][:address_components][2][:short_name]
    @country = location_info[:results][0][:address_components][3][:long_name]
    @time = Time.at(weather_info[:current][:dt]).strftime("%-l:%M %p, %B%e")
    @timezone_offset = weather_info[:timezone_offset]
    @timezone = weather_info[:timezone]
    @current = convert_temp(weather_info[:current][:temp]).round(0)
    @current_high = convert_temp(weather_info[:daily][0][:temp][:max]).round(0)
    @current_low = convert_temp(weather_info[:daily][0][:temp][:min]).round(0)
    @summary = weather_info[:current][:weather][0][:main]
    @icon = weather_info[:current][:weather][0][:icon]
    @feels_like = convert_temp(weather_info[:current][:feels_like]).round(0)
    @humidity = weather_info[:current][:humidity]
    @visibility = check_visibility(weather_info[:current][:visibility])
    @uv_index = weather_info[:current][:uvi]
    @uv_category = uv_category
    @sunrise = Time.at(weather_info[:current][:sunrise]).strftime("%-l:%M %p")
    @sunset = Time.at(weather_info[:current][:sunset]).strftime("%-l:%M %p")
    @hourly_forecasts = create_hourly_forecast(weather_info[:hourly])
    @daily_forecasts = create_daily_forecast(weather_info[:daily])
  end

  def convert_temp(temp)
    (temp - 273.15) * 1.8 + 32
  end

  def check_visibility(visibility)
    return "N/A" if visibility.nil?
  end
  
  def uv_category
    return 'low' if [0,1,2].include?(@uv_index)
    return 'moderate' if [3,4,5].include?(@uv_index)
    return 'high' if [6,7].include?(@uv_index)
    return 'very high' if [8,9,10].include?(@uv_index)
    return 'extreme' if @uv_index > 10
  end
  
  def create_hourly_forecast(hourly_info)
    hourly_info[0..7].map do |info|
      HourlyForecast.new(info)
    end
  end

  def create_daily_forecast(daily_info)
    daily_info[1..7].map do |info|
      DailyForecast.new(info)
    end
  end
end
