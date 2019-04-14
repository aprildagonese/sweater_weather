FactoryBot.define do
  factory :user do
    email { "whatever@example.com" }
    password  { "test" }
    api_key { SecureRandom.urlsafe_base64.to_s }
  end
end
