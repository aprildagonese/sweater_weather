require 'rails_helper'

describe "Favorites API" do
  it "stores a favorite" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h4")

    post '/api/v1/favorites', params: {
                                        "location": "Denver, CO",
                                        "api_key": "jgn983hy48thw9begh98h4539h4"
                                      }
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end

  it "can not store a favorite with incorrect api key" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h4")

    post '/api/v1/favorites', params: {
                                        "location": "Denver, CO",
                                        "api_key": "88888888888888888"
                                      }
    expect(response.status).to eq(401)
  end

  it "can not store a favorite without an api key" do
    user = create(:user)

    post '/api/v1/favorites', params: {
                                        "location": "Denver, CO"
                                      }
    expect(response.status).to eq(401)
  end
end
