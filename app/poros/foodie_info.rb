class FoodieInfo
  attr_reader :end_location, 
              :forecast
              

  def initialize(location, weather)
    @end_location = location[:results][0][:formatted_address]
    @weather = convert_temp(weather[:current][:temp]).round
    @summary = weather[:current][:weather][0][:description]
    @forecast = create_forecast_hash(@weather, @summary)
    binding.pry
  end

  def convert_temp(temp)
    (temp - 273.15) * 1.8 + 32
  end

  def create_forecast_hash(weather, summary)
    hashed_info = {}
    hashed_info[:summary] = summary
    hashed_info[:temperature] = weather
    hashed_info
  end
end
