
class CreateTasksAndListsTables < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_string
      t.boolean :task_completed, default: false
      t.integer :index
      t.integer :list_id
    end

    create_table :lists do |t|
      t.string :list_name
    end
  end
end