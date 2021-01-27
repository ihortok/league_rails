class Team < ApplicationRecord
  has_many :contracts
  has_many :participants, through: :contracts
  has_many :players, through: :participants
  belongs_to :city
  belongs_to :league
end
