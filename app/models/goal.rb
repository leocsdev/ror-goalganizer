class Goal < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true
end
