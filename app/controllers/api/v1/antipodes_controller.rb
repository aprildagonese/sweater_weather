class Api::V1::AntipodesController < ApiController
  def show
    render json: AntipodeSerializer.new(AntipodeRequestFacade.new(params[:loc]))
  end
end
