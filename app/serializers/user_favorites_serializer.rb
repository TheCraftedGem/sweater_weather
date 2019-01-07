class UserFavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :favorite_locations, :location_forecast
end