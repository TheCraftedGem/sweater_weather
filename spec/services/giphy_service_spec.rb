require 'rails_helper'

describe 'giphy service' do
  before(:each) do
    @service = GiphyService.new("Mostly sunny in the morning.")
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(GiphyService)
  end

  it 'returns url string when given summary' do
    expect(@service.get_url).to be_a(String) 
    expect(@service.get_url).not_to be_nil
  end
end