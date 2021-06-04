class Goal < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true

    # Associate with task
    has_many :tasks
end
