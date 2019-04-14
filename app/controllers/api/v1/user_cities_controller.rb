class Api::V1::UserCitiesController < ApiController
  def create
    if UserCity.log_favorite(params[:location], params[:api_key])
      render status: 201, json: favorite_saved
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

  def destroy
    favorites = UserCity.delete_favorite(params[:location], params[:api_key])
    if favorites
      render status: 200, json: favorites
    else
      render status: 401, json: unauthorized
    end
  end
end
