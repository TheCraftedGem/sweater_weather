require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'returing user gets api key in response' do
    user = create(:user, email: 'whatever@example.com', password: "password" )
    params = {location: "Denver, co", api_key: user.api_key}
    post "/api/v1/favorites?location=#{params[:location]}&api_key=#{params[:api_key]}"

    expect(response).to be_successful
    
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:location)
    expect(results[:data][:attributes][:location]).to eq(user.favorites.last.location)
  end

  it 'does not save favorite with wrong api key' do
    user = create(:user, email: 'whatever@example.com', password: "password" )
    params = {location: "Denver, co", api_key: user.api_key}
    post "/api/v1/favorites?location=#{@location}&api_key=potatoe"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Error")
  end

    it 'does not save favorite with no api key' do
      post "/api/v1/favorites?location=#{@location}"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Error")
    end

    it 'returns list of favorite locations when sending api key in params' do 
      user = create(:user, email: 'whatever@example.com', password: "password" )
      user.favorites.create(location: 'Denver, co')
      user.favorites.create(location: 'Golden, co')

      get "/api/v1/favorites?api_key=#{user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to have_key(:data)
      binding.pry
      expect(results[:data][:attributes]).to have_key(:favorite_locations)
      expect(results[:data][:attributes]).to have_key(:location_forecast)
    end
end