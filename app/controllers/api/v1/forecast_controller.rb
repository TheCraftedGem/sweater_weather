class Api::V1::ForecastController < ApiBaseController
  def show
    forecast = ForecastFacade.new(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end