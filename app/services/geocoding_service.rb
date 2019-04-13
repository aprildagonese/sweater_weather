class GeocodingService

  def country_name(location)
    forecast(location)[:results][0][:address_components][3][:long_name]
  end

  def state_name(location)
    forecast(location)[:results][0][:address_components][2][:short_name]
  end

  def city_name(location)
    forecast(location)[:results][0][:address_components][0][:short_name]
  end

  def lat_long(location)
    forecast(location)[:results][0][:geometry][:location]
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


# def fetch_forecast(location)
#   url = "#{ENV['DARKSKY_SECRET_KEY']}/#{lat},#{long}"
#   json(url)
# end
#
# def json(url)
#   response = conn.get(url)
#   JSON.parse(response.body, symbolize_names: true)
# end
#
# def conn
#   Faraday.new("https://api.darksky.net/forecast/") do |f|
#     f.adapter Faraday.default_adapter
#   end
# end
