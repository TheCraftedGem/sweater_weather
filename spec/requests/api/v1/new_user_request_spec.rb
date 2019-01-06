require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'creates a user and returns an API key' do

    params = { email: 'whatever@example.com', password: 'password', password_confirmation: 'password'}

    post "/api/v1/users?email=#{params[:email]}&password=#{params[:password]}&password_confirmation=#{params[:password_confirmation]}"

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:attributes]).to have_key(:api_key)
    expect(results[:data][:attributes][:api_key]).to be_a String
    expect(User.all.count).to eq(1)
  end
    it 'fails if passwords do not match' do
    params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "potatoe323"
    }

    post "/api/v1/users?email=#{params[:email]}&password=#{params[:password]}&password_confirmation=#{params[:password_confirmation]}"

    expect(response.status).to eq(422)
    expect(response.body).to eq("Woops Try Again")
    expect(User.all.count).to eq(0)
  end
end