class League < ApplicationRecord
  has_many :teams
  belongs_to :country
end
