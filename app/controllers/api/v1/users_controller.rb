class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render status: 201, json: ApiKey.new
    else
      render status: 409, json: {error: "User could not be saved with those credentials."}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
