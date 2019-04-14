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

  it "does not store duplicate favorites" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h4")
    city1 = create(:city, location: "Denver, CO")
    city2 = create(:city, location: "Portland, OR")
    city3 = create(:city, location: "Seattle, WA")
    user_city1 = create(:user_city, user: user, city: city1)
    user_city2 = create(:user_city, user: user, city: city2)
    user_city3 = create(:user_city, user: user, city: city3)

    expect(user.user_cities.count).to eq(3)
    post '/api/v1/favorites', params: {
                                        "location": "Denver, CO",
                                        "api_key": "jgn983hy48thw9begh98h4539h4"
                                      }
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user.user_cities.count).to eq(3)
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

  it "can retrive a user's favorites" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h4")
    city1 = create(:city, location: "Denver, CO")
    city2 = create(:city, location: "Portland, OR")
    city3 = create(:city, location: "Seattle, WA")
    user_city1 = create(:user_city, user: user, city: city1)
    user_city2 = create(:user_city, user: user, city: city2)
    user_city3 = create(:user_city, user: user, city: city3)

    get '/api/v1/favorites', params: {
                                        "api_key": "jgn983hy48thw9begh98h4539h4"
                                      }
    expect(response.status).to eq(200)

    cities = JSON.parse(response.body, symbolize_names: true)

    expect(cities[0][:city]).to eq("Denver")
    expect(cities[0][:state]).to eq("CO")
    expect(cities[0][:weather][:currently][:summary]).to be_a(String)
    expect(cities[1][:city]).to eq("Portland")
    expect(cities[1][:state]).to eq("OR")
    expect(cities[1][:weather][:currently][:summary]).to be_a(String)
    expect(cities[2][:city]).to eq("Seattle")
    expect(cities[2][:state]).to eq("WA")
    expect(cities[2][:weather][:currently][:summary]).to be_a(String)
  end

  it "can't retrieve favorites with an incorrect or missing API key" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h5")
    city1 = create(:city, location: "Denver, CO")
    city2 = create(:city, location: "Portland, OR")
    city3 = create(:city, location: "Seattle, WA")
    user_city1 = create(:user_city, user: user, city: city1)
    user_city2 = create(:user_city, user: user, city: city2)
    user_city3 = create(:user_city, user: user, city: city3)

    #incorrect api_key
    get '/api/v1/favorites', params: {
                                        "api_key": "ABC983hy48thw9begh98h453XYZ"
                                      }
    expect(response.status).to eq(401)

    #missing api_key
    get '/api/v1/favorites', params: {
                                        "api_key": nil
                                      }
    expect(response.status).to eq(401)
  end

  it "deletes a favorite" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h5")
    city1 = create(:city, location: "Denver, CO")
    city2 = create(:city, location: "Portland, OR")
    city3 = create(:city, location: "Seattle, WA")
    user_city1 = create(:user_city, user: user, city: city1)
    user_city2 = create(:user_city, user: user, city: city2)
    user_city3 = create(:user_city, user: user, city: city3)

    expect(user.user_cities.count).to eq(3)

    delete '/api/v1/favorites', params: {
                                        "location": "Denver, CO",
                                        "api_key": "jgn983hy48thw9begh98h4539h5"
                                        }
    expect(response.status).to eq(200)
    expect(user.user_cities.count).to eq(2)

    cities = JSON.parse(response.body, symbolize_names: true)
    expect(cities.count).to eq(2)
    expect(cities[0][:city]).to eq("Portland")
    expect(cities[1][:city]).to eq("Seattle")
  end

  it "can't delete favorites with an incorrect or missing API key" do
    user = create(:user, api_key: "jgn983hy48thw9begh98h4539h5")
    city1 = create(:city, location: "Denver, CO")
    city2 = create(:city, location: "Portland, OR")
    city3 = create(:city, location: "Seattle, WA")
    user_city1 = create(:user_city, user: user, city: city1)
    user_city2 = create(:user_city, user: user, city: city2)
    user_city3 = create(:user_city, user: user, city: city3)

    #incorrect api_key
    delete '/api/v1/favorites', params: {
                                        "location": "Denver, CO",
                                        "api_key": "jgn983hy48thw9begh98h4539h4"
                                        }
    expect(response.status).to eq(401)

    #missing api_key
    get '/api/v1/favorites', params: {
                                        "api_key": nil
                                      }
    expect(response.status).to eq(401)
  end
end
