class Api::V1::BackgroundsController < ApiController
  def show
    location = params[:location]
    background = Rails.cache.fetch(location) { Background.new(location) }
    render json: background
  end
end
