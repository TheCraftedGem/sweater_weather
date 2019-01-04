class GiphyFacade 
  attr_reader :weather
  def initialize(weather)
    @summary = weather.forecast.daily_weather.map {|day| GiphyFetch.new(day.summary)}
  end
end