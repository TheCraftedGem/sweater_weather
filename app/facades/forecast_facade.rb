class ForecastFacade 
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def forecast
    Forecast.new(weather)
  end

  def coords
    @bing ||= BingService.new(@location).get_coords
  end

  def weather
    @darksky ||= DarkService.new(coords).get_weather
  end
end