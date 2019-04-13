require 'rails_helper'

describe "Forecasts API" do
  xit "returns current info" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    expect(data).to eq("Weather Info")
  end
end
