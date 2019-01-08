class GiphyService
  def initialize(summary)
    @summary = summary.gsub(' ', '+').gsub('.', '')
    @conn    = Faraday.new(url: 'https://api.giphy.com') do |faraday|
      faraday.headers["api_key"] = ENV["GIPHY_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def get_gifs
    get_url("/v1/gifs/search?q=#{@summary}")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end