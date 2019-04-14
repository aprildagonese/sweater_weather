class Favorite
  def self.generate(user_cities)
    user_cities.map do |location|
      {
        "location": location,
        "current_weather": Forecast.new(location).weather
      }
  end
end
