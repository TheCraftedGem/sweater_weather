class HourlyWeather 
  def initialize(hourly_data)
    @time = hourly_data[:time]
    @summary = hourly_data[:summary]
    @icon = hourly_data[:icon]
    @chance_of_percipertation = hourly_data[:precipProbability]
    @temperature = hourly_data[:temperature]
    @feels_like = hourly_data[:apparentTemperature]
    @dew_point = hourly_data[:dewPoint]
    @humidity = hourly_data[:humidity]
    @uv_index = hourly_data[:visibility]
  end
end