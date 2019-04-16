class ApiController < ActionController::API

  def unauthorized
    { error: "API key required" }
  end

  def favorite_saved
    { success: "City stored as favorite"}
  end

  def invalid_credentials
    { error: "Invalid credentials." }
  end

  def credentials_conflict
    { error: "User could not be saved with those credentials." }
  end
end
