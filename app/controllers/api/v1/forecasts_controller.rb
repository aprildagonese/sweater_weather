class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = Forecast.new(params[:location])
    render json: forecast
  end
end
