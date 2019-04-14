class Api::V1::CitiesController < ApplicationController
  def create
    if City.log_favorite(params[:location], params[:api_key])
      render status: 201, json: { success: "City stored as favorite"}
    else
      render status: 401, json: { error: "API key required" }
    end
  end
end
