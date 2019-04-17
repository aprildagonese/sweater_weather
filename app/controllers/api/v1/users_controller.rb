class Api::V1::UsersController < ApiController
  def create
    user = User.new(user_params)
    if user.save && user.update_attributes(api_key: ApiKey.new.key)
      render status: 201, json: {api_key: user.api_key}
    else
      render status: 409, json: credentials_conflict
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
