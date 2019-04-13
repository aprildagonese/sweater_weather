require 'rails_helper'

describe UnsplashService do
  it "gets an image" do
    portland_image_url = UnsplashService.new.city_image("Portland")

    expect(portland_image_url).to eq("https://images.unsplash.com/photo-1436505743955-a98c0d3eb1a8?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjY2NTExfQ")

    denver_image_url = UnsplashService.new.city_image("Denver")

    expect(denver_image_url).to eq("https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjY2NTExfQ")
  end
end
