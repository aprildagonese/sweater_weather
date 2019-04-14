class Api::V1::ForecastsController < ApiController
  def show
    forecast = Forecast.new(params[:location])
    render json: forecast
  end
end
