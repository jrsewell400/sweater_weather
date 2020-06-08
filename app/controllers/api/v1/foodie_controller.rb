class Api::V1::FoodieController < ApplicationController
  def show
    # Getting weather information for end location
    location_info = GoogleService.new.get_geocode(params[:end])
    lat = location_info[:results][0][:geometry][:location][:lat]
    long = location_info[:results][0][:geometry][:location][:lng]
    weather_info = WeatherService.new.weather_data(lat, long)
    binding.pry
    foodie_info = FoodieInfo.new(location_info, weather_info)
  end
end
