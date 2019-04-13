require 'rails_helper'

describe "Favorites API" do
  it "stores a favorite" do
    post '/api/v1/favorites', params: {
                                        "location": "Denver, CO",
                                        "api_key": "jgn983hy48thw9begh98h4539h4"
                                      }
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end
