class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      render status: 200, json: {api_key: user.api_key}
    else
      render status: 403, json: invalid_credentials
    end
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end
