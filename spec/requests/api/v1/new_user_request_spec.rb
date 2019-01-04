require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'creates a user and returns an API key' do
    
    parameters = "?email=whatever@example.com&password=password&password_confirmation=password"

    post "/api/v1/users#{parameters}"

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:attributes]).to have_key(:api_key)
    expect(results[:data][:attributes][:api_key]).to be_a String
  end
end