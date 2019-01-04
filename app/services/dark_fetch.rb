class DarkFetch
attr_reader  :latitude
                      :longitude
                      :get_weather
  def initialize(location)
    @latitude    = location.first
    @longitude = location.second
  end

  def get_weather
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}/#{@latitude},#{@longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end
end