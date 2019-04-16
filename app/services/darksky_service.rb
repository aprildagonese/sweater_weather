class DarkskyService

  def fetch_forecast(lat, long)
    url = "#{ENV['DARKSKY_SECRET_KEY']}/#{lat},#{long}"
    json(url)
  end

  def json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
