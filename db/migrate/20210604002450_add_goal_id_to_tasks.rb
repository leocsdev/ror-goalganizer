class AddGoalIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :goal_id, :integer
  end
end
