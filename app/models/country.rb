class Country < ApplicationRecord
  has_many :cities
  has_many :leagues
  has_many :players
end
