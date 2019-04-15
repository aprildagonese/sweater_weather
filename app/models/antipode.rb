class Antipode
  def initialize(location)
    geocode = GeocodingService.new
    geocode.geocode(location)
    lat_long = geocode.lat_long
    antipode_data = AmypodeService.new.fetch_antipode(lat_long[:lat], lat_long[:lng])
    lat = antipode_data[:data][:attributes][:lat]
    long = antipode_data[:data][:attributes][:long]
    antipode_location = GeocodingService.new.reverse_geocode(lat, long)
  end
end


#{
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                 				},
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
