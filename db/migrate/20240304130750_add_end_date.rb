class AddEndDate < ActiveRecord::Migration[7.1]
  def change
    add_column :task_tables, :end_date, :date
  end
end
