class DarkskyService

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def fetch_forecast
    url = "#{ENV['DARKSKY_SECRET_KEY']}/#{lat},#{long}"
    json(url)
  end

  def self.fetch_forecast(lat, long)
    new(lat, long).fetch_forecast
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

  private
    attr_reader :lat, :long

end
