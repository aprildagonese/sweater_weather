require 'rails_helper'

describe "Users API" do
  it "returns an api_key when unique credentials supplied" do
    #user registers with unique credentials
    post "/api/v1/users", params: {email: "whatever@example.com",
                                   password: "password",
                                   password_confirmation: "password"}
    expect(response).to be_successful
    expect(response.status).to eq(201)
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:api_key]).to be_a(String)

    #user tries to register with non-unique credentials
    post "/api/v1/users", params: {user: {email: "whatever@example.com",
                                         password: "password",
                                         password_confirmation: "password"} }
    expect(response).to_not be_successful
    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:error]).to eq("User could not be saved with those credentials.")
    expect(response.status).to eq(409)
  end
end
