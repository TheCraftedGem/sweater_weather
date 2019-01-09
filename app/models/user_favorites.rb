class UserFavorites 
  attr_reader :id
  def initialize(favorite_locations)
    @id = 1
    @favorite_locations = favorite_locations
  end

  def current_weather
    @location_forecast ||= @favorite_locations.map {|location| LocationWeather.new(location)}
  end
end