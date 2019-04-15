class Api::V1::AntipodesController < ApiController
  def show
    render json: AntipodeSerializer.new(params[:loc]).data
  end
end
