class Favorite < ApplicationRecord
  def self.store(location, api_key)
    city = Favorite.find_or_create_by(location: location)
  end
end
