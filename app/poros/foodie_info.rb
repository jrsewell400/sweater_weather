class FoodieInfo
  attr_reader :id,
              :end_location, 
              :forecast,
              :travel_time,
              :restaurant
              
  def initialize(location, weather, distance, food)
    @weather = convert_temp(weather[:current][:temp]).round
    @summary = weather[:current][:weather][0][:description]
    @restaurant_name = food[:restaurants][0][:restaurant][:name]
    @restaurant_address = food[:restaurants][0][:restaurant][:location][:address]
    
    @id = nil
    @end_location = location[:location]
    @forecast = create_forecast_hash(@weather, @summary)
    @travel_time = distance[:routes][0][:legs][0][:duration][:text]
    @restaurant = create_restaurant_hash(@restaurant_name, @restaurant_address)
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

  def create_restaurant_hash(name, address)
    hashed_info = {}
    hashed_info[:name] = name
    hashed_info[:address] = address
    hashed_info
  end
end
