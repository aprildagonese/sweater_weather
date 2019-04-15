class Api::V1::BackgroundsController < ApiController
  def show
    render json: BackgroundFacade.new(params[:location])
  end
end
