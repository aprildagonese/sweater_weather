require 'rails_helper'

describe "Forecasts API" do
  it "returns forecast info" do
    get '/api/v1/antipode?loc=hongkong'

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data][0][:id]).to eq("1")
    expect(data[:data][0][:type]).to eq("antipode")
    expect(data[:data][0][:attributes]).to be_a(Hash)
    expect(data[:data][0][:attributes][:location_name]).to be_a(String)
    expect(data[:data][0][:attributes][:forecast]).to be_a(Hash)
    expect(data[:data][0][:search_location]).to be("Hong Kong")
  end
end


# An antipode is the point on the planet that is diametrically opposite.
# You will create an endpoint like so:, `/api/v1/antipode?loc=hongkong`
# You will use the `Amypode API` to determine the antipode for Hong Kong.
# [`http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`]
# This is a sample request. Amypode API requires header based authentication. It expects the  `api_key` header to be set to your key, which is `oscar_the_grouch`
# Your endpoint will give the user the original city, and the antipode’s location name and its current weather summary and current temperature in a format like this:
# ```
# {
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
