class UserCity < ApplicationRecord
  belongs_to :user
  belongs_to :city

  def self.log_favorite(location, api_key)
    city = City.find_or_create_by(location: location)
    user = User.find_by(api_key: api_key)
    user_city = UserCity.find_or_create_by(city: city, user: user)
    user_city.save
  end

  def self.fetch_favorites(api_key)
    user = User.find_by(api_key: api_key)
    if user.nil?
      false
    else
      Favorites.generate(user.user_cities)
    end
  end

  def self.delete_favorite(location, api_key)
    user = User.find_by(api_key: api_key)
    if user.nil?
      false
    else
      UserCity.joins(:city)
              .select("user_cities.*")
              .where(user: user, cities: {location: location})[0]
              .destroy
      Favorites.generate(user.user_cities)
    end
  end

  # def remove
  #   user = self.user
  #   if self.destroy
  #     Favorites.generate(user.user_cities)
  #   else
  #     "Favorite could not be deleted at this time."
  #   end
  # end

end
