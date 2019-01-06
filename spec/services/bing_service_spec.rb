require 'rails_helper'

describe 'bing maps service' do
  before(:each) do
    @service = BingService.new('denver, co')
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(BingService)
  end

  context 'returns the latitude and longitude of a given location' do
    it '.get_coords' do
      expect(@service.get_coords).to eq([39.7400093078613, -104.99201965332])
    end
  end
end