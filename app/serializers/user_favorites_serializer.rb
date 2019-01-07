class UserFavoritesSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user_favorites
  attributes :id, :current_weather, :location

end