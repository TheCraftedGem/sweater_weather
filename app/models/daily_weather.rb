class DailyWeather
  attr_reader :summary,
                      :time,
                      :id
            
  def initialize(day_data)
    @id = 1
    @time =  day_data[:time]
    @summary = day_data[:summary]
    # @url = get_url
    @copyright = "2018"
  end

  def get_url 
    GiphyService.new(@summary).search
  end

  # def giphy_url
  #   @url[:data][0][:url]
  # end
end