class Team < ApplicationRecord
  has_many :contracts
  has_many :participants, through: :contracts
  belongs_to :city
  belongs_to :league
end
