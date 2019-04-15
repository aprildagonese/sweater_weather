class Api::V1::AntipodesController < ApiController
  def show
    render json: Antipode.new(params[:loc]).prettify_data
  end
end
