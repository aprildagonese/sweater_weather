class Forecast
  attr_reader :weather

  def initialize(location)
    forecast_data(location)
  end

  def forecast_data(location)
    data = location_data(location)
    @city = data.city
    @state = data.state
    @country = data.country
    lat = data.lat
    long = data.long
    @weather = weather_data(lat, long)
  end

  def location_data(location)
    GeocodeFacade.new(location)
  end

  def weather_data(lat, long)
    DarkskyService.new.fetch_forecast(lat, long)
  end

end
