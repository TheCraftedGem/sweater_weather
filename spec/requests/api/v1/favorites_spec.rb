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
    expect(results[:data][:attributes][:location]).to eq(user.favorites)
  end
end