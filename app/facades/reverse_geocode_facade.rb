class ReverseGeocodeFacade
  attr_reader :lat, :long, :name
  def initialize(lat, long)
    @_lat = lat
    @_long = long
    reverse_location_data
  end

  def reverse_location_data
    data = reverse_location
    @lat = data[:results][0][:geometry][:location][:lat]
    @lat = data[:results][0][:geometry][:location][:lng]
    @name = data[:results][0][:address_components][2][:long_name]
  end

  def reverse_location
    @reverse_location ||= service.json("?latlng=#{lat},#{long}")
  end

  def service
    GeocodingService.new
  end

  private
    def lat
      @_lat
    end

    def long
      @_long
    end
end
