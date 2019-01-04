class GiphyFetch
attr_reader  
  def initialize(summary)
    @summary= summary.gsub(' ', '+').gsub('.', '')
  binding.pry
  end

  def get_gifs
    response = Faraday.get("https://api.giphy.com/v1/gifs/search?", query)
    parsed =JSON.parse(response.body, symbolize_names: true)
      binding.pry
  end

  def query 
    {
      q: @summary,
      api_key: ENV['GIPHY_KEY']
    }
  end
end