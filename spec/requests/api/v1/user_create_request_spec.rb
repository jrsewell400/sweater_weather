require 'rails_helper'

RSpec.describe 'User Create Request' do
  it 'can create a user' do
    user = {email: "jordan@example.com",
            password: "password",
            password_confirmation: "password"}

    post '/api/v1/users', params: user

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)[:body]

    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
  end

  it 'should return 400 error if not correct information is sent' do
    user = {email: "example@example.com",
            password: "password",
            password_confirmation: "password123"}

    post '/api/v1/users', params: user

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:status]).to eq(400)
    expect(json[:body]).to eq("Password confirmation doesn't match Password")
  end
end 
