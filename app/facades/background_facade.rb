class BackgroundFacade
  attr_reader :id, :image

  def initialize(location)
    @_location = location
    @id = 1
    @image = city_image
  end

  def city_image
    Rails.cache.fetch("image-#{location}") { image_url(geocode_service.city) }
  end

  def geocode_service
    Rails.cache.fetch("geocode-#{location}") { GeocodeFacade.new(location) }
  end

  def image_url(city)
    unsplash_service.city_image(city)
  end

  def unsplash_service
    UnsplashService.new
  end

  private
    def location
      @_location
    end
end
