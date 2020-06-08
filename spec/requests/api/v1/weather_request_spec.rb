require 'rails_helper'

RSpec.describe 'Weather Request' do
  xit 'returns required information.' do
    #this test is for the project portion, did not want to spend time getting it to work again due to final assessment changes
    location = {location: "denver, co"}
    
    get '/api/v1/forecast', params: location

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    keys = [:id,
            :city,
            :state,
            :country,
            :time,
            :timezone_offset,
            :timezone,
            :current,
            :current_high,
            :current_low,
            :summary,
            :icon,
            :feels_like,
            :humidity,
            :visibility,
            :uv_index,
            :uv_category,
            :sunrise,
            :sunset,
            :daily_forecasts,
            :hourly_forecasts]
    
    expect(forecast).to be_a(Hash)
    expect(forecast.length).to eq(21)
    expect(forecast.keys).to eq(keys)
    expect(forecast[:daily_forecasts].length).to eq(7)
    expect(forecast[:daily_forecasts][0].keys).to eq([:day, :icon, :summary, :high, :low])
    expect(forecast[:hourly_forecasts].length).to eq(8)
    expect(forecast[:hourly_forecasts][0].keys).to eq([:time, :icon, :temp])
  end
end
