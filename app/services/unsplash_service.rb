class UnsplashService
  def city_image(city)
    json("/search/photos?query=#{city}")[:results][0][:urls][:full]
  end

  def json(url)
    response = Rails.cache.fetch(url) { conn.get(url) }
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.unsplash.com") do |f|
      f.adapter Faraday.default_adapter
      f.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
      f.params['per_page'] = 1
      f.params['orientation'] = 'landscape'
    end
  end
end
