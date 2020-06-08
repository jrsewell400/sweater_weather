class Api::V1::ForecastController < ApplicationController
  def show
    location_info = GoogleService.new.get_geocode(params[:location])
    lat = location_info[:results][0][:geometry][:location][:lat]
    long = location_info[:results][0][:geometry][:location][:lng]
    weather_info = WeatherService.new.weather_data(lat, long)
    forecast = ForecastData.new(location_info, weather_info)
    render json: ForecastSerializer.new(forecast)
  end
end
