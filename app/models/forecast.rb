class Forecast 
  attr_reader :current_weather,
                      :hourly_weather,
                      :daily_weather,
                      :id
  def initialize(weather_data)
    @id = weather_data[:currently][:time]
    @current_weather  = CurrentWeather.new(weather_data[:currently])
    @hourly_weather   =  weather_data[:hourly][:data].map {|hour| HourlyWeather.new(hour)}
    @daily_weather      =  weather_data[:daily][:data].map { |day| DailyWeather.new(day)}
  end

end