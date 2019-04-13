class Forecast
  def initialize(location)
    forecast_data(location)
  end

  def forecast_data(location)
    service = GeocodingService.new(location)
    @city = service.city
    @state = service.state
    @country = service.country
    lat = service.lat_long[:lat]
    long = service.lat_long[:lng]
    @weather = weather_data(lat, long)
  end

  def weather_data(lat, long)
    DarkskyService.new.fetch_forecast(lat, long)
  end
end
