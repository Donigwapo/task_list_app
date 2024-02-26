class CreateTaskTables < ActiveRecord::Migration[7.1]
  def change
    create_table :task_tables do |t|
      t.string :taskname
      t.string :taskdescription
      t.references :category, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
