class Task < ApplicationRecord
  validates :name,
    presence: true

    # Associate with goal
    belongs_to :goal
end
