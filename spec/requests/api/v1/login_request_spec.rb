require 'rails_helper'

describe "Login API" do
  User.create(email: "whatever@example.com", password: "password")
  
  it "returns an api_key" do
    post "/api/v1/sessions", params: {
                                        email: "whatever@example.com",
                                        password: "password"
                                      }
    expect(response).to be_successful
    expect(response.status).to eq(200)

    body = JSON.parse(response.body, symbolize_names: true)
    expect(body[:api_key]).to eq("jgn983hy48thw9begh98h4539h4")
  end
end
