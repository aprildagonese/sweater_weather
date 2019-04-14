class ApplicationController < ActionController::Base
  helper_method :current_user

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def unauthorized
    { error: "API key required" }
  end

  def favorite_saved
    { success: "City stored as favorite"}
  end

  def invalid_credentials
    {error: "Invalid credentials."}
  end

end
