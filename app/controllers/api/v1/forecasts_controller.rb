class Api::V1::ForecastsController < ApiController
  def show
    forecast = ForecastFacade.new(params[:location])
    render json: forecast
  end
end
