class UserCity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  def self.log_favorite(location, api_key)
    city = City.find_or_create_by(location: location)
    user = User.find_by(api_key: api_key)
    user_city = UserCity.new(city: city, user: user)
    user_city.save
  end

  def self.fetch_favorites(api_key)
    user = User.find_by(api_key: api_key)
    if user.nil?
      return false
    else
      Favorite.generate(user.user_cities)
    end
  end

end
