class DarkService
  def initialize(location)
    @latitude    = location.first
    @longitude   = location.second
  end

  def get_weather
    get_json("#{ENV['DARK_SKY_KEY']}/#{@latitude},#{@longitude}")
  end

  private
  attr_reader :latitude, :longitude

  def conn
    Faraday.new("https://api.darksky.net/forecast/")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end