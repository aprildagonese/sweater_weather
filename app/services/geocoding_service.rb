class GeocodingService
  attr_reader :country, :state, :city, :lat_long

  def initialize(location)
    set_location_data(location)
  end

  def set_location_data(location)
    @country = geo_info(location)[3][:long_name]
    @state = geo_info(location)[2][:short_name]
    @city = geo_info(location)[0][:short_name]
    @lat_long = forecast(location)[:results][0][:geometry][:location]
  end

  def geo_info(location)
    forecast(location)[:results][0][:address_components]
  end

  def forecast(location)
    @forecast_data ||= json("?address=#{location}")
  end

  def json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.adapter Faraday.default_adapter
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end
