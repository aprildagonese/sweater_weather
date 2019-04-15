class AntipodeSerializer
  def initialize(location)
    @_location = location
    data
  end

  def data
    {
        "data": [
            {
                "id": "1",
                "type": "antipode",
                "attributes": {
                    "location_name": reverse_geocode.name,
                    "forecast": weather.antipode_forecast,
                    "search_location": geocode.long_name
                }
            }
        ]
    }
  end

  def geocode
    GeocodeFacade.new(location)
  end

  def antipode
    AntipodeFacade.new(geocode.lat, geocode.long)
  end

  def weather
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
