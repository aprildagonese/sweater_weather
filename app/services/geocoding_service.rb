class GeocodingService
  def geocode(location)
    json("?address=#{location}")
  end

  def reverse_geocode(lat, long)
    json("?latlng=#{lat},#{long}")
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
