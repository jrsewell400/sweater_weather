class Api::V1::FoodieController < ApplicationController
  def show
    # If I had more time, I would refactor this to use a facade to make this controller skinnier
    location_info = GoogleService.new.get_geocode(params[:end])
    weather_info = WeatherService.new.weather_data(location_info[:lat], location_info[:lng])
    distance_info = GoogleService.new.get_distance(params[:start], params[:end])
    food_info = ZomatoService.new.get_restaraunt(location_info[:lat], location_info[:lng], params[:search])
    foodie_info = FoodieInfo.new(location_info, weather_info, distance_info, food_info)
    render json: FoodieSerializer.new(foodie_info)
  end
end
