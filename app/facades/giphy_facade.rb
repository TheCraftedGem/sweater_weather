class GiphyFacade 
  attr_reader :location, :id
  def initialize(location)
    @id = 1
    @location = location
  end

  def giphy_url
    @giphy_url ||= GiphyService.new(summary).get_url
  end

  def get_coords
    @get_coords ||= ForecastFacade.new(@location).coords
  end

  def get_weather
    @get_weather ||= ForecastFacade.new(get_coords).weather
  end

  def summary 
    @summary ||= get_weather[:currently][:summary]
  end

  def time 
    @time = get_weather[:currently][:time]
  end
end