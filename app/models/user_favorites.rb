class UserFavorites 
  attr_reader :id,
                      :favorite_locations
  def initialize(favorite_locations)
    @id = 1
    @favorite_locations = favorite_locations
    location_forecast
  end

  def location_forecast
    @location_forecast ||= @favorite_locations.map {|location| LocationWeather.new(location.location).get_current_weather}
  end

end