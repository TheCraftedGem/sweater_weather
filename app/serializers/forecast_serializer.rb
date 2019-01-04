class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  attributes :id,  :daily_weather

end

