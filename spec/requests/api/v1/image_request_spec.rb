require 'rails_helper'

RSpec.describe 'Background Image Request' do
  it 'can return a json response url if location is sent', :vcr do
    location = {location: 'denver,co'}
    get '/api/v1/backgrounds', params: location
  
    expect(response).to be_successful
    
    json = JSON.parse(response.body, symbolize_names: true)
    
    expect(json[:data][:attributes]).to have_key(:image_url)
  end
end
