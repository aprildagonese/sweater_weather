class City < ApplicationRecord
  has_many :user_cities

  def self.log_favorite(location, api_key)
    city = City.find_or_create_by(location: location)
    user = User.find_by(api_key: api_key)
    user_city = UserCity.new(city: city, user: user)
    user_city.save
  end
end
