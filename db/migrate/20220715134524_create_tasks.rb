class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :task_id
      t.string :title
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
