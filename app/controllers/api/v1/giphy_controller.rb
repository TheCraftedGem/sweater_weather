class Api::V1::GiphyController < ApplicationController 
  def show 
    render json: ForecastFacade.new(params[:location])
  end
end