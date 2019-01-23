class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather_forecast, :hourly_weather, :daily_weather
end

