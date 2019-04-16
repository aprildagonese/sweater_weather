class ForecastFacade
  attr_reader :weather, :id, :city, :state, :country

  def initialize(location)
    @_location = location
    forecast_data
  end

  def forecast_data
    @city = geocode_facade.city
    @state = geocode_facade.state
    @country = geocode_facade.country
    lat = geocode_facade.lat
    long = geocode_facade.long
    @weather = forecast(lat, long)
  end

  def geocode_facade
    Rails.cache.fetch("geocode-#{location}") { GeocodeFacade.new(location) }
  end

  def forecast(lat, long)
    Rails.cache.fetch("forecast-#{lat},#{long}", expires_in: 1.hour) { service.fetch_forecast(lat, long) }
  end

  def service
    DarkskyService.new
  end

  private

    def location
      @_location
    end
end
