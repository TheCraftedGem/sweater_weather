class Api::V1::GiphyController < ApplicationController 
  def show 
    forecast = GiphyFacade.new(params[:location])
    render json: GiphySerializer.new(forecast.daily_forecast)
  end
end