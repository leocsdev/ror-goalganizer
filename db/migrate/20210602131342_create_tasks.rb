class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.datetime :deadline
      t.string :status

      t.timestamps
    end
  end
end
