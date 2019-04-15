class GeocodingService
  attr_reader :country, :state, :city, :lat_long, :long_name

  def reverse_geocode(lat, long)
    reverse_location_data(lat, long)
  end

  def geocode(location)
    location_data(location)
  end

  def location_data(location)
    if geo_info(location).count == 1
      @lat_long = location(location)[:results][0][:geometry][:location]
      @long_name = geo_info(location)[0][:long_name]
    else
      @country = geo_info(location)[3][:long_name]
      @state = geo_info(location)[2][:short_name]
      @city = geo_info(location)[0][:short_name]
      @lat_long = location(location)[:results][0][:geometry][:location]
    end
  end

  def reverse_location_data(lat, long)
    data = reverse_location(lat, long)
    @lat_long = data[:results][0][:geometry][:location]
    @long_name = data[:results][0][:address_components][2][:long_name]
  end

  def geo_info(location)
    location(location)[:results][0][:address_components]
  end

  def location(location)
    @location ||= json("?address=#{location}")
  end

  def reverse_location(lat, long)
    @reverse_location ||= json("?latlng=#{lat},#{long}")
  end

  def json(url)
    response = Rails.cache.fetch(url) { conn.get(url) }
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.adapter Faraday.default_adapter
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end
