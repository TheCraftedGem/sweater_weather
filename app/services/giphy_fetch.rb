class GiphyFetch
attr_reader  
  def initialize(summary)
    @summary= summary.gsub(' ', '+').gsub('.', '')
  end

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

  def get_url 
    get_gifs[:data][0][:url]
  end
end