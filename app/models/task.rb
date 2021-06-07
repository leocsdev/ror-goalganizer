class Task < ApplicationRecord
  validates :name, :deadline, :status,
    presence: true

  validate :date_cannot_be_in_the_past
  
  def date_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add("Due date", " can't be in the past")
    end
  end

  # Associate with goal
  belongs_to :goal
end
