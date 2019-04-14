require 'rails_helper'

describe "Login API" do
  it "returns an api_key" do
    create(:user, email: "whatever@example.com", password: "password")
    post "/api/v1/sessions", params: {
                                        email: "whatever@example.com",
                                        password: "password"
                                      }
    expect(response).to be_successful
    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:api_key]).to be_a(String)
  end
end
