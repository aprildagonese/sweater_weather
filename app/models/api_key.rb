class ApiKey
  def key
    SecureRandom.urlsafe_base64.to_s
  end
end
