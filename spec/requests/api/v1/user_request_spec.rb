require 'rails_helper'

describe "Users API" do
  it "returns an api_key" do
     post "/api/v1/users", params: {user: {email: "whatever@example.com",
                                           password: "password",
                                           password_confirmation: "password"} }
     expect(response).to be_successful
     body = JSON.parse(response.body, symbolize_names: true)
     expect(body[:api_key]).to eq("jgn983hy48thw9begh98h4539h4")

     post "/api/v1/users", params: {user: {email: "whatever@example.com",
                                           password: "password",
                                           password_confirmation: "password"} }
     expect(response).to be_successful
     body = JSON.parse(response.body, symbolize_names: true)
     expect(body[:error]).to eq("User could not be saved.")
  end
end
