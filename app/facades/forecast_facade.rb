class ForecastFacade 
  attr_reader :bing,
                      :weather,
                      :forecast
  def initialize(location)
    @bing        =  BingFetch.new(location)
    @weather  =  DarkFetch.new(@bing.get_coords)
    @forecast  =   ForecastSerializer.new(Forecast.new(@weather.get_weather))
  end
end