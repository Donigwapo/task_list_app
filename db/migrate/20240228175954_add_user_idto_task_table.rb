class AddUserIdtoTaskTable < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_tables, :user, foreign_key: true
  end
end
