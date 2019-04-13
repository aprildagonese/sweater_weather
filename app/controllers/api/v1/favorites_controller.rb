class Api::V1::FavoritesController < ApplicationController
  def create
    binding.pry
    if Favorite.store(params[:location], params[:api_key])
      render status: 201
    else
      render status: 401
    end
  end
end
