class RemoveCategoryFromTaskTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :task_tables, :category_id
  end
end
