require 'rails_helper'

describe GeocodingService do
  it "gets lat and long" do
    denver_response = GeocodingService.new.geocode("Denver CO")
    lat_long = denver_response.lat_long
    city_name = denver_response.city
    state_name = denver_response.state
    country_name = denver_response.country

    expect(lat_long[:lat]).to eq(39.7392358)
    expect(lat_long[:lng]).to eq(-104.990251)
    expect(city_name).to eq("Denver")
    expect(state_name).to eq("CO")
    expect(country_name).to eq("United States")

    portland_response = GeocodingService.new.geocode("Portland OR")
    lat_long = portland_response.lat_long
    city_name = portland_response.city
    state_name = portland_response.state
    country_name = portland_response.country

    expect(lat_long[:lat]).to eq(45.5154586)
    expect(lat_long[:lng]).to eq(-122.6793461)
    expect(city_name).to eq("Portland")
    expect(state_name).to eq("OR")
    expect(country_name).to eq("United States")
  end
end
