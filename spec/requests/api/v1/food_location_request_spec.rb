require 'rails_helper'

describe 'Food Location Request' do
  describe 'locations and food type request sent to endpoint' do
    it 'response is given with end location, travel time, weather forecast, and a restaurant' do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      json = JSON.parse(response.body)

      expect(json['data']['attributes']).to include(
        end_location: 'Pueblo, CO, USA',
        travel_time: '1 hours 48 min',
        forecast: {
          summary: 'clear sky',
          temperature: '72'
        },
        restaurant: {
          name: 'Angelo\'s Pizza Parlor',
          address: '105 E Riverwalk, Pueblo 8100'
        }
      )
    end
  end
end
