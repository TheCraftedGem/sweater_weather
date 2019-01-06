class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :summary, :time, :url
end

