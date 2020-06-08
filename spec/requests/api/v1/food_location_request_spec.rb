require 'rails_helper'

describe 'Food Location Request' do
  describe 'locations and food type request sent to endpoint' do
    it 'response is given with end location, travel time, weather forecast, and a restaurant' do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:id]).to eq(nil)
      expect(json[:data][:type]).to eq("foodie")
      expect(json[:data][:attributes].keys).to eq([:end_location, :travel_time, :forecast, :restaurant])
      
      
      # expect(json[:data][:attributes]).to include(
      #   end_location: 'Pueblo, CO, USA',
      #   travel_time: '1 hour 48 mins',
      #   forecast: {
      #     summary: 'clear sky',
      #     temperature: 77
      #   },
      #   restaurant: {
      #     name: 'Bingo Burger',
      #     address: '101 Central Plaza 81003'
      #   }
      # )
    end
  end
end
