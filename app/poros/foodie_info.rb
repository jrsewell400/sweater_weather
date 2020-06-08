class FoodieInfo
  attr_reader :end_location, 
              :forecast,
              :travel_time
              
  def initialize(location, weather, distance, food)
    @weather = convert_temp(weather[:current][:temp]).round
    @summary = weather[:current][:weather][0][:description]

    @end_location = location[:results][0][:formatted_address]
    @forecast = create_forecast_hash(@weather, @summary)
    @travel_time = distance[:routes][0][:legs][0][:duration][:text]
    @restaurant = 
    # binding.pry
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
