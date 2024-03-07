class AddCategoryIdToTaskTables < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_tables, :category, foreign_key: true
  end
end
