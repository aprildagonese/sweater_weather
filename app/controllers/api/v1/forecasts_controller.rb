class Api::V1::ForecastsController < ApiController
  def show
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]))
  end
end
