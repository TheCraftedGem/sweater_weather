require 'rails_helper'


describe "GET /api/v1/forecast?location" do
  it "returns coordinates of passed in location " do

    get '/api/v1/gifs?location=denver,co'
 
    expect(response.status).to eq 200
  end
end

