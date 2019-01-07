class CurrentWeather 
  attr_reader :time
                      
  def initialize(weather)
    @time                                    =  weather[:time]
    @summary                           =  weather[:summary]
    @icon                                    =  weather[:icon]
    @temperature                      =  weather[:temperature]
    @chance_of_percipitation  =  weather[:precipProbability]
    @humidity                           =  weather[:humidity] 
    @uv_index                           =  weather[:uvIndex]
    @visibility                            =  weather[:visibility]
    @feels_like                           =  weather[:apparentTemperature]
  end
end