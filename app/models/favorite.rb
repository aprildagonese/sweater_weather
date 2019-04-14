class Favorite
  def self.generate(user_cities)
    user_cities.map do |user_city|
      {
        "location": user_city.city.location,
        "current_weather": Forecast.new(user_city.city.location).weather
      }
    end
  end
end
