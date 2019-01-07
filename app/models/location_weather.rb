class LocationWeather 
  def initialize(favorite_location)
    @favorite_location = favorite_location
    get_current_weather
  end

  def get_current_weather
    @current_weather ||= CurrentWeather.new(get_forecast[:currently]) 
  end

  private

  def get_coords
    @bing  ||= BingService.new(@favorite_location).get_coords
  end

  def get_forecast
    @dark ||=  DarkService.new(get_coords).get_weather
  end
end