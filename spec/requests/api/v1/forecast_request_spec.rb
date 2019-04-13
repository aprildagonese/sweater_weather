require 'rails_helper'

describe "Forecasts API" do
  it "returns forecast info" do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:city]).to eq("Denver")
    expect(data[:state]).to eq("CO")
    expect(data[:country]).to eq("United States")
    expect(data[:weather][:latitude]).to eq(39.7392358)
    expect(data[:weather][:longitude]).to eq(-104.990251)
    expect(data[:weather][:currently][:time]).to be_a(Integer)
    expect(data[:weather][:currently][:summary]).to be_a(String)
    expect(data[:weather][:daily][:data][0][:temperatureHigh]).to be_a(Float)
    expect(data[:weather][:daily][:data][0][:temperatureLow]).to be_a(Float)
  end
end
