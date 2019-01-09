class GiphyFacade 
  attr_reader :location, :id
  def initialize(location)
    @id = 1
    @location = location
  end

  def daily_forecast
    Forecast.daily_forecast(get_weather)
  end

  def get_coords
    @get_coords ||= ForecastFacade.new(@location).coords
  end

  def get_weather
    @get_weather ||= ForecastFacade.new(get_coords).weather
  end
end