class Api::V1::CitiesController < ApplicationController
  def create
    if UserCity.log_favorite(params[:location], params[:api_key])
      render status: 201, json: { success: "City stored as favorite"}
    else
      render status: 401, json: unauthorized
    end
  end

  def index
    favorites = UserCity.fetch_favorites(params[:api_key])
    if favorites
      render status: 200, json: favorites
    else
      render status: 401, json: unauthorized
    end
  end
end
