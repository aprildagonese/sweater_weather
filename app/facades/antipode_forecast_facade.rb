class AntipodeForecastFacade
  def initialize(lat, long)
    @_lat = lat
    @_long = long
  end

  def antipode_forecast
    {
      "summary": "#{forecast[:hourly][:summary]}",
      "current_temperature": "#{forecast[:currently][:temperature]}",
    }
  end

  def forecast
    service.fetch_forecast(lat, long)
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
