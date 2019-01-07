class UserFavorites 
  def initialize(favorite_locations)
    @id = 1
    @favorite_locations = favorite_locations
    location_forecast
  end

  def location_forecast
    @favorite_locations ||= favorite_locations.map {|location| LocationWeather.new(location)}
  end
end