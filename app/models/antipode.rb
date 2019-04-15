class Antipode
  def initialize(location)
    prettify_data(location)
  end

  def prettify_data(location)
    {
        "data": [
            {
                "id": "1",
                "type": "antipode",
                "attributes": {
                    "location_name": "Antipode City Name",
                    "forecast": {
                        "summary": "Mostly Cloudy,
                        "current_temperature": "72",
                    				},
                "search_location": "Hong Kong"
                }
            }
        ]
    }
  end

  def geocode(location)
    geocode = GeocodingService.new
    geocode.geocode(location)
    geocode.lat_long
  end

  def antipode_data(lat_long)
    @antipode_data ||= AmypodeService.new.fetch_antipode(geocode(location)[:lat], geocode(location)[:lng])
  end

  def antipode_lat
    @antipode_data[:data][:attributes][:lat]
  end

  def antipode_long
    @antipode_data[:data][:attributes][:long]
  end
  
  def reverse_geocode(antipode_lat, antipode_long)
    GeocodingService.new.reverse_geocode(antipode_lat, antipode_long)
  end
end
