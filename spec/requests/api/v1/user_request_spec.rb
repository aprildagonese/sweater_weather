require 'rails_helper'

describe "Users API" do
  it "returns a background url" do
     post "/api/v1/users", params: {user: {email: "whatever@example.com",
                                           password: "password",
                                           password_confirmation: "password"} }
     expect(response).to be_successful
     api_key = JSON.parse(response.body, symbolize_names: true)
     expect(api_key).to eq("jgn983hy48thw9begh98h4539h4")
  end
end
