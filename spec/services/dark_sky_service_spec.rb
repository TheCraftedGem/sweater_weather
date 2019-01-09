require 'rails_helper'

RSpec.describe 'Dark Sky API request' do
	it 'returns weather data' do
		VCR.use_cassette("vcr_dark_sky_results") do
			response = DarkService.new([39.7392358, -104.990251]).get_weather
			expect(response).to be_a Hash
			expect(response).to have_key(:latitude)
			expect(response).to have_key(:longitude)
		end
	end
end