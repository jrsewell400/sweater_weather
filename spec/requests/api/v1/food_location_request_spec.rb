require 'rails_helper'

describe 'Food Location Request' do
  describe 'locations and food type request sent to endpoint' do
    it 'response is given with end location, travel time, weather forecast, and a restaurant' do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      json = JSON.parse(response.body)

      expect(json['data']['attributes']).to include(
        end_location: 'pueblo,co',
        travel_time: '1 hours 48 min',
        forecast: {
          summary: 'Cloudy with a chance of meatballs',
          temperature: '83'
        },
        restaurant: {
          name: 'Angelo\'s Pizza Parlor',
          address: '105 E Riverwalk, Pueblo 8100'
        }
      )
    end
  end
end
