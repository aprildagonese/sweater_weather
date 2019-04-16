class AntipodeRequestFacade
  attr_reader :id, :type, :location_name, :forecast, :search_location

  def initialize(location)
    @_location = location
    @id = 1
    @type = "antipode"
    @location_name = reverse_geocode.name
    @forecast = forecast
    @search_location = geocode.long_name
  end

  def geocode
    GeocodeFacade.new(location)
  end

  def antipode
    AntipodeFacade.new(geocode.lat, geocode.long)
  end

  def forecast
    AntipodeForecastFacade.new(antipode.new_lat, antipode.new_long)
  end

  def reverse_geocode
    ReverseGeocodeFacade.new(antipode.new_lat, antipode.new_long)
  end

  private

    def location
      @_location
    end

end
