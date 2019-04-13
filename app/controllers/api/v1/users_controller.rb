class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save && user.update_attribute(api_key: ApiKey.new.key)
      render status: 201, json: {api_key: user.api_key}
    else
      render status: 409, json: {error: "User could not be saved with those credentials."}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
