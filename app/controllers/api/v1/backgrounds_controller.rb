class Api::V1::BackgroundsController < ApiController
  def show
    render json: BackgroundSerializer.new(BackgroundFacade.new(params[:location]))
  end
end
