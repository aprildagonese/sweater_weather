require 'rails_helper'

describe DarkskyService do
  it "gets forecast data" do
    # response = DarkskyService.new.fetch_forecast(39.7392, -104.9903)
    # response = DarkskyService.new.fetch_forecast(39.7392, -104.9903)
    response = DarkskyService.fetch_forecast(39.7392, -104.9903)

    expect(response[:latitude]).to eq(39.7392)
    expect(response[:longitude]).to eq(-104.9903)
  end
end
