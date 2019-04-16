class BackgroundFacade
  attr_reader :id, :image

  def initialize(location)
    @_location = location
    @id = 1
    geocode_city
  end

  def geocode_city
    service = GeocodeFacade.new(location)
    image_url(service.city)
  end

  def image_url(city)
    @image = unsplash.city_image(city)
  end

  def unsplash
    UnsplashService.new
  end

  private
    def location
      @_location
    end
end
