class Antipode
  def initialize(location)
    @_location = location
    prettify_data
  end

  def prettify_data
    {
        "data": [
            {
                "id": "1",
                "type": "antipode",
                "attributes": {
                    "location_name": "#{antipode_name}",
                    "forecast": antipode_forecast,
                "search_location": "Hong Kong"
                }
            }
        ]
    }
  end

  def location_lat_long
    geo_service.lat_long
  end

  def antipode_data
    @antipode_data ||= AmypodeService.new.fetch_antipode(location_lat_long[:lat], location_lat_long[:lng])
  end

  def antipode_lat
    antipode_data[:data][:attributes][:lat]
  end

  def antipode_long
    antipode_data[:data][:attributes][:long]
  end

  def reverse_geocode
    @reverse_geocode ||= GeocodingService.new.reverse_geocode(antipode_lat, antipode_long)
  end

  def antipode_name
    binding.pry
    reverse_geocode.long_name
  end

  def antipode_lat_long
    reverse_geocode.lat_long
  end

  def antipode_forecast
    {
      "summary": "Mostly Cloudy",
      "current_temperature": "72",
    }
  end

  private

  def location
    @_location
  end

  def geo_service
    @geo_service ||= GeocodingService.new
    @geo_service.geocode(location)
    @geo_service
  end

  def reverse_geo_service

  end

end
