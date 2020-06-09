require 'rails_helper'

RSpec.describe 'User Create Request' do
  it 'can create a user' do
    user = {user: {email: "jordan@example.com",
                   password: "password",
                   password_confirmation: "password"
                  }
           }

    post '/api/v1/users', params: user

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)[:body]

    expect(response.code).to eq("201")
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:type]).to eq("users")
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns 400 error if incorrect information is provided' do
    user = {user: {email: "jordan@example.com",
                   password: "password",
                   password_confirmation: "incorrectpassword"
                  }
           }

    post '/api/v1/users', params: user

    expect(response).not_to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.code).to eq("400")
    expect(json[:body]).to eq("Password confirmation doesn't match Password")
  end
end 
