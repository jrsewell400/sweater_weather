class Api::V1::FoodieController < ApplicationController
  def show
    # Getting weather information for end location
    location_info = GoogleService.new.get_geocode(params[:end])
    lat = location_info[:results][0][:geometry][:location][:lat]
    long = location_info[:results][0][:geometry][:location][:lng]
    weather_info = WeatherService.new.weather_data(lat, long)

    # Getting distance information between locations
    distance_info = GoogleService.new.get_distance(params[:start], params[:end])

    # Getting restaraunt information from Zomato
    food_info = ZomatoService.new.get_restaraunt(lat, long, params[:search])

    # Information aggregated in poro
    foodie_info = FoodieInfo.new(location_info, weather_info, distance_info, food_info)

    # Render serialized response after aggregation
    render json: FoodieSerializer.new(foodie_info)
  end
end
