class Api::V1::GiphyController < ApplicationController 
  def show 
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]).forecast)
  end
end