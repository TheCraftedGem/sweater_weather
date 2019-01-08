class GiphyFacade 
  attr_reader :location, :id
  def initialize(location)
    @id = 1
    @location = location
  end

  def giphy_url
    @giphy_url ||= giphy_search_response.url
  end

  def giphy_search_response
    @giphy_search_response ||= Giphy.new(giphy_search_service)
  end

  def giphy_search_service
    @giphy_search ||= GiphyService.new(summary).search
  end

  def get_coords
    @get_coords ||= ForecastFacade.new(@location).coords
  end

  def get_weather
    @get_weather ||= ForecastFacade.new(get_coords).weather
  end

  def summary 
    @summary ||= ForecastFacade.new(get_coords).current_weather_summary
  end

  def time 
    @time ||= ForecastFacade.new(get_coords).current_weather_time
  end
end