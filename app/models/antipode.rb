class Antipode
  def initialize(location)
    lat_long = GeocodingService.new(location).lat_long
    binding.pry
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