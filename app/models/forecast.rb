class Forecast 
  attr_reader :id, :weather_data

  def initialize(weather_data)
    @id = 1
    @weather_data = weather_data
    load_data
  end

  def load_data 
    current_weather
    hourly_weather
    daily_weather
  end

  def self.build(weather_data)
    current_weather
    hourly_weather
    daily_weather
  end

  def current_weather
    @current_weather ||= CurrentWeather.new(@weather_data[:currently])
  end 

  def hourly_weather
    @hourly_weather  ||= @weather_data[:hourly][:data].map {|hour| HourlyWeather.new(hour)}
  end 

  def daily_weather
    @daily_weather   ||= @weather_data[:daily][:data].map { |day| DailyWeather.new(day)}
  end
end