class DailyWeather
  attr_reader :summary,
                      :time,
                      :url,
                      :id 
  def initialize(day_data)
    @id = day_data[:time]
    @time =  day_data[:time]
    @summary = day_data[:summary]
    @url = GiphyFetch.new(day_data[:summary]).get_url
    @copyright = "2018"
    # @icon = day_data[:icon]
    # @sunrise = day_data[:sunriseTime]
    # @sunset = day_data[:sunsetTime]
    # @moon_phase = day_data[:moonPhase]
    # @percipitaion = day_data[:precipIntensity]
    # @precip_intensity_max = day_data[:precipIntensityMax]
    # @precip_intensity_max_time = day_data[:precipIntensityMaxTime]
    # @precip_probability = day_data[:precipProbability]
    # @precip_accumulation = day_data[:precipAccumulation]
    # @precip_type = day_data[:precipType]
    # @temperature_high = day_data[:temperatureHigh]
    # @temperature_high_time  = day_data[:temperatureHighTime]
    # @temperature_low = day_data[:temperatureLow]
    # @temperature_low_time = day_data[:temperatureLowTime]
    # @high_temp_feels_like = day_data[:apparentTemperatureHigh]
    # @high_temp_feels_like_time = day_data[:apparentTemperatureHighTime]
    # @low_temp_feels_like = day_data[:apparentTemperatureLow]
    # @low_temp_feels_like_time = day_data[:apparentTemperatureLowTime]
    # @dew_point = day_data[:dewPoint]
    # @humidity = day_data[:humidity]
    # @pressure = day_data[:pressure]
    # @wind_speed = day_data[:windSpeed]
    # @wind_gust = day_data[:windGust]
    # @wind_gust_time =day_data[:windGustTime]
    # @wind_bearing = day_data[:windBearing]
    # @cloud_cover = day_data[:cloudCover]
    # @uv_index = day_data[:uvIndex]
    # @uv_index_time = day_data[:uvIndexTime]
    # @visibility = day_data[:visibility]
    # @ozone = day_data[:ozone]
    # @temperature_min = day_data[:temperatureMin]
    # @temperature_min_time  = day_data[:temperatureMinTime]
    # @temperature_max = day_data[:temperatureMax]
    # @temperature_max_time = day_data[:temperatureMaxTime]
    # @apparent_temperature_min = day_data[:apparentTemperatureMin]
    # @apparentl_temperature_min_time = day_data[:apparentTemperatureMinTime]
    # @apparent_temperature_max = day_data[:apparentTemperatureMax]
    # @apparent_temperature_max_time = day_data[:apparentTemperatureMaxTime]
  end
end