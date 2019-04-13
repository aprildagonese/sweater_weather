require 'rails_helper'

describe "Backgrounds API" do
  it "returns a background url" do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:image]).to eq("https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjY2NTExfQ")
  end
end
