class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :time, :summary, :giphy_url
end