class Background
  def initialize(location)
    geocode_city(location)
  end

  def geocode_city(location)
    service = GeocodeFacade.new(location)
    image_url(service.city)
  end

  def image_url(city)
    @image = UnsplashService.new.city_image(city)
  end
end
