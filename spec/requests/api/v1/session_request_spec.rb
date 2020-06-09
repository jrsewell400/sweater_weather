require 'rails_helper'

RSpec.describe 'Session Create Request' do
  it 'returns user when the correct information is provided' do
    user = User.create!(email: "jordan@example.com",
                        password: "password",
                        password_confirmation: "password")

    login_info = {session: {email: "jordan@example.com",
                            password: "password"}
                 }

    post '/api/v1/sessions', params: login_info

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)[:body]

    expect(response.code).to eq("200")
        
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:type]).to eq("users")
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns 400 error if incorrect information is provided' do
    user = {email: "jordan@example.com",
            password: "password",
            password_confirmation: "password"}

    login_info = {session: {email: "jordan@example.com",
                            password: "incorrectpassword"}
                 }

    post '/api/v1/sessions', params: login_info

    expect(response).not_to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.code).to eq("400")
    expect(json[:body]).to eq("Invalid username and/or password")
  end
end 
