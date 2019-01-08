class GiphyService
  def initialize(summary)
    @summary= summary.gsub(' ', '+').gsub('.', '')
  end

  def get_url 
    parsed_gif[:data][0][:url]
  end

  def parsed_gif
    @parsed_gif ||= Giphy.new(get_gifs)
  end
  
  private

  def get_gifs
    response = Faraday.get("https://api.giphy.com/v1/gifs/search?", query)
    JSON.parse(response.body, symbolize_names: true)
  end

  def query 
    {
      q: @summary,
      api_key: ENV['GIPHY_KEY']
    }
  end
end