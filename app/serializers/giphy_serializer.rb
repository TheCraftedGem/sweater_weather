class GiphySerializer
  include FastJsonapi::ObjectSerializer
  set_type :giphy
  attributes :id, :time, :summary, :urlk
end