require 'rails_helper'

describe 'Food Location Request' do
  describe 'locations and food type request sent to endpoint' do
    it 'response is given with end location, travel time, weather forecast, and a restaurant' do
      get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:id]).to eq(nil)
      expect(json[:data][:type]).to eq("foodie")
      expect(json[:data][:attributes].keys).to eq([:id, :end_location, :travel_time, :forecast, :restaurant])
      expect(json[:data][:attributes][:end_location]).to eq('Pueblo, CO, USA')
      
      expect(json[:data][:attributes][:forecast].keys).to eq([:summary, :temperature])
      expect(json[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(json[:data][:attributes][:forecast][:temperature]).to be_a(Integer)
      
      expect(json[:data][:attributes][:restaurant].keys).to eq([:name, :address])
      expect(json[:data][:attributes][:restaurant][:name]).to eq('Bingo Burger')
      expect(json[:data][:attributes][:restaurant][:address]).to eq('101 Central Plaza 81003')
    end
  end
end
