class Api::V1::GiphyController < ApplicationController 
  def show 
    render json: GiphyFacade.new(ForecastFacade.new(params[:location]))
  end
end