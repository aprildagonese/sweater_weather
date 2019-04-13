require 'rails_helper'

describe GeocodingService do
  it "gets lat and long" do
    response = GeocodingService.new.fetch_lat_long("Denver", "CO")
    expect(response[:lat]).to eq(39.7392358)
    expect(response[:lng]).to eq(-104.990251)

    response = GeocodingService.new.fetch_lat_long("Portland", "OR")
    expect(response[:lat]).to eq(45.5154586)
    expect(response[:lng]).to eq(-122.6793461)
  end
end
