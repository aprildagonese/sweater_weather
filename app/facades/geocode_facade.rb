class GeocodeFacade
  attr_reader :country, :state, :city, :lat, :long, :long_name

  def initialize(location)
    @_location = location
    location_data
  end

  def location_data
    if geo_info.count == 1
      @lat = json[:results][0][:geometry][:location][:lat]
      @long = json[:results][0][:geometry][:location][:lng]
      @long_name = geo_info[0][:long_name]
    else
      @country = geo_info[3][:long_name]
      @state = geo_info[2][:short_name]
      @city = geo_info[0][:short_name]
      @lat = json[:results][0][:geometry][:location][:lat]
      @long = json[:results][0][:geometry][:location][:lng]
    end
  end

  def geo_info
    json[:results][0][:address_components]
  end

  def json
    Rails.cache.fetch("geocode-service-#{location}") { service.geocode(location) }
  end

  def service
    GeocodingService.new
  end

  private

    def location
      @_location
    end

end
