class Goal < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true

    # has_many :tasks -> associate with task
    # dependent :destroy -> delete all associated tasks when goal is deleted
    has_many :tasks, dependent :destroy
end
