class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  attributes :id, :current_weather, :daily_weather, :hourly_weather
end