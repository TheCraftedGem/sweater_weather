class ForecastFacade 
  attr_reader :location
  def initialize(location)
    @location = location

  end

  def forecast
    # @forecast |= Forecast.build(weather)

    @forecast ||= Forecast.new(weather)
  end

  def coords
    @bing ||= BingService.new(@location).get_coords
  end

  def weather
    @darksky ||= DarkService.new(coords).get_weather
  end

  def current_weather_summary 
    weather[:currently][:summary]
  end

  def current_weather_time 
    weather[:currently][:time]
  end
end