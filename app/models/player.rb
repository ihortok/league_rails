class Player < ApplicationRecord
  belongs_to :participant

  as_enum :position, goalkeeper: 0, defender: 1, midfielder: 2, attaker: 3

  def age
    Time.current.year - participant.date_of_birth.year
  end
end
