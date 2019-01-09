class ForecastFacade 
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def current_weather_forecast
    @current_weather ||= Forecast.current_weather_forecast(weather)
  end

  def coords
    @bing ||= BingService.new(@location).get_coords
  end

  def weather
    @darksky ||= DarkService.new(coords).get_weather
  end

  def hourly_weather
    @hourly_weather ||= Forecast.hourly_forecast(weather)
  end

  def daily_weather
    @daily_weather ||= Forecast.daily_forecast(weather)
  end
end