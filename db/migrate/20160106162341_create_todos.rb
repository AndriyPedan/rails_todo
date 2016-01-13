class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.datetime :completed_at
      t.references :todo_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
