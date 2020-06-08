require 'rails_helper'

RSpec.describe WeatherService do
  context 'instance methods' do
    context 'forecast_data' do
      it "returns weather data" do
        service = WeatherService.new
        json = service.weather_data('39.7392358','-104.990251')
        
        expect(json.length).to eq(8)
        expect(json.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :minutely, :hourly, :daily])
        expect(json[:timezone]).to be_a(String)
        expect(json[:lat]).to be_a(Float)
        expect(json[:lon]).to be_a(Float)
        expect(json[:current][:dt]).to be_a(Integer)
      end
    end
  end
end
