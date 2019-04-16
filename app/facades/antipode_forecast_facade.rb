class AntipodeForecastFacade
  def initialize(lat, long)
    @_lat = lat
    @_long = long
    @summary = "#{forecast[:hourly][:summary]}"
    @current_temperature = "#{forecast[:currently][:temperature]}"
  end

  def forecast
    Rails.cache.fetch("forecast-#{lat},#{long}", expires_in: 1.hour) { service.fetch_forecast(lat, long) }
  end

  def service
    DarkskyService.new
  end

  private
    def lat
      @_lat
    end

    def long
      @_long
    end
end
