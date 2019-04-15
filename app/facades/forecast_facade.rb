class ForecastFacade
  attr_reader :weather

  def initialize(location)
    @_location = location
    forecast_data
  end

  def forecast_data
    data = location_data
    @city = data.city
    @state = data.state
    @country = data.country
    lat = data.lat
    long = data.long
    @weather = weather_data(lat, long)
  end

  def location_data
    GeocodeFacade.new(location)
  end

  def weather_data(lat, long)
    DarkskyService.new.fetch_forecast(lat, long)
  end

  private

    def location
      @_location
    end
end
