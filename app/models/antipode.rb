class Antipode
  def initialize(location)
    @_location = location
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
                "search_location": "#{location_name}"
                }
            }
        ]
    }
  end

  private

  def location_lat_long
    geo_service.lat_long
  end

  def location_name
    geo_service.long_name
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
    reverse_geo_service
  end

  def antipode_name
    reverse_geocode.long_name
  end

  def antipode_forecast
    forecast = DarkskyService.new.fetch_forecast(antipode_lat, antipode_long)
    {
      "summary": "#{forecast[:hourly][:summary]}",
      "current_temperature": "#{forecast[:currently][:temperature]}",
    }
  end

  def location
    @_location
  end

  def geo_service
    @geo_service ||= GeocodingService.new
    @geo_service.geocode(location)
    @geo_service
  end

  def reverse_geo_service
    @reverse_geocode ||= GeocodingService.new
    @reverse_geocode.reverse_geocode(antipode_lat, antipode_long)
    @reverse_geocode
  end

end
