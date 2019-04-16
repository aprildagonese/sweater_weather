require 'rails_helper'

describe DarkskyService do
  it "get forecast data uncached" do
    url = "#{ENV['DARKSKY_SECRET_KEY']}/39.7392,-104.9903"
    response = DarkskyService.new.json(url)

    expect(response[:latitude]).to eq(39.7392)
    expect(response[:longitude]).to eq(-104.9903)
    expect(response[:currently][:summary]).to be_a(String)
  end

  it "gets forecast data with caching" do
    response = DarkskyService.new.fetch_forecast(39.7392, -104.9903)

    expect(response[:latitude]).to eq(39.7392)
    expect(response[:longitude]).to eq(-104.9903)
  end
end
