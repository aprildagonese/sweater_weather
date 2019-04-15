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

  def service
    @geo_service ||= GeocodingService.new
    @geo_service.geocode(location)
    @geo_service
  end

  def location_lat_long
    binding.pry
    service.lat_long
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
  attr_reader :location

  def location
    @_location
  end
end
