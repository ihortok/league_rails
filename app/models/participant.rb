class Participant < ApplicationRecord
  has_many :contracts
  has_many :teams, through: :contracts
  has_one :player
  belongs_to :country
end
