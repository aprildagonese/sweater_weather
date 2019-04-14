class Favorites
  def self.generate(user_cities)
    user_cities.map do |user_city|
      Forecast.new(user_city.city.location)
    end
  end
end
