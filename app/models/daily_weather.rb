class DailyWeather
  attr_reader :summary,
                      :time,
                      :giphy_url,
                      :id,
                      :day_data
            
  def initialize(day_data)
    @id = 1
    @day_data = day_data
    @time =  day_data[:time]
    @summary = day_data[:summary]
    @url = get_url
    @copyright = "2018"
  end

  def get_url 
    GiphyService.new(@day_data[:summary]).search
  end

  def giphy_url
    @url[:data][0][:url]
  end
end