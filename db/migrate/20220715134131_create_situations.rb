class CreateSituations < ActiveRecord::Migration[7.0]
  def change
    create_table :situations do |t|
      t.string :name, limit: 150

      t.timestamps
    end
  end
end
