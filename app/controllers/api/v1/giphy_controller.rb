class Api::V1::GiphyController < ApplicationController 
  def show 
    forecast = ForecastFacade.new(params[:location]).forecast.daily_weather
    render json: ForecastSerializer.new(forecast)
  end
end