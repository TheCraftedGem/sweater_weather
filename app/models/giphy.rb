class Giphy
  attr_reader :url
  def initialize(attributes)
    @url = attributes[:data][0][:url]
  end
end