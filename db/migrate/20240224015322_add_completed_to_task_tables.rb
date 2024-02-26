class AddCompletedToTaskTables < ActiveRecord::Migration[7.1]
  def change
    add_column :task_tables, :completed, :boolean, default: false
  end
end
