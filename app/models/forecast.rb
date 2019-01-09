class Forecast 
  attr_reader :id, :weather_data

  def initialize(weather_data)
    @id = 1
    @weather_data = weather_data
  end

  def self.current_weather_forecast(weather_data)
    @current_weather ||= CurrentWeather.new(weather_data[:currently])
  end

  def self.hourly_forecast(weather_data)
    @hourly_forecast ||= weather_data[:hourly][:data].map {|hour| HourlyWeather.new(hour)}
  end

  def self.daily_forecast(weather_data)
    @daily_weather ||= weather_data[:daily][:data].map {|day| DailyWeather.new(day)}
  end
end