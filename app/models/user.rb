class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  has_many :user_cities
  has_many :cities, through: :user_cities
end
