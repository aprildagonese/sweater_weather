class AmypodeService

  def fetch_antipode(lat, long)
    url = "/api/v1/antipodes?lat=#{lat}&long=#{long}"
    json(url)
  end

  def json(url)
    response = Rails.cache.fetch(url) { conn.get(url) }
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://amypode.herokuapp.com") do |f|
      f.adapter Faraday.default_adapter
      f.headers['api_key'] = ENV['AMYPODE_KEY']
    end
  end
end


# def json(url)
#   response = Rails.cache.fetch(url) { conn.get(url) }
#   JSON.parse(response.body, symbolize_names: true)
# end
#
# def conn
#   Faraday.new("http://amypode.herokuapp.com") do |f|
#     f.adapter Faraday.default_adapter
#     f.headers['api_key'] = ENV['AMYPODE_KEY']
#   end
# end
