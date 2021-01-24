class Contract < ApplicationRecord
  belongs_to :participant
  belongs_to :team

  scope :active, -> { where(end_date: nil) }
  scope :not_active, -> { where('end_date != ?', nil) }

  as_enum :position, player: 0, coach: 1
end
