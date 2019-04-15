require 'rails_helper'

describe "Forecasts API" do
  it "returns forecast info" do
    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data][0][:id]).to eq("1")
    expect(data[:data][0][:type]).to eq("antipode")
    expect(data[:data][0][:attributes]).to be_a(Hash)
    expect(data[:data][0][:attributes][:location_name]).to be_a(String)
    expect(data[:data][0][:attributes][:forecast]).to be_a(Hash)
    expect(data[:data][0][:attributes][:search_location]).to eq("Hong Kong")
  end
end
