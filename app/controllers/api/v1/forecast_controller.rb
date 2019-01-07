class Api::V1::ForecastController < ApiBaseController
  def show
    render json: ForecastFacade.new(params[:location]).forecast
  end
end