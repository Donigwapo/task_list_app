class AddIsCompletedToTaskTable < ActiveRecord::Migration[7.1]
  def change
    add_column :task_tables, :isCompleted, :boolean
  end
end
