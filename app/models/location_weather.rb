class LocationWeather 
  attr_reader :id, :location
  def initialize(favorite_location)
    @id = 1
    @location = favorite_location.location
    current_weather
  end

  def current_weather
    @current_weather ||= ForecastFacade.new(@location).current_weather_forecast
  end
end