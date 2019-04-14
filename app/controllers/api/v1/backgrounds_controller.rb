class Api::V1::BackgroundsController < ApiController
  def show
    render json: Background.new(params[:location])
  end
end
