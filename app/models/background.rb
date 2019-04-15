class Background
  def initialize(location)
    geocode_city(location)
  end

  def geocode_city(location)
    city = GeocodingService.new.geocode(location).city
    image_url(city)
  end

  def image_url(city)
    @image = UnsplashService.new.city_image(city)
  end
end
