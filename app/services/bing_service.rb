class BingService
  def initialize(params)
    @params = params
  end

  def get_coords
    response = Faraday.get("http://dev.virtualearth.net/REST/v1/Locations/", query)
    JSON.parse(response.body, symbolize_names: true) [:resourceSets][0][:resources][0][:point][:coordinates]
  end

  def city 
    @params.split(', ').first
  end

  def state 
    @params.split(', ').second
  end

  def query
    {
      locality: city,
      adminDistrict: state,
      countryRegion: 'United States',
      key: ENV['BING_API_KEY']
    }
  end
end