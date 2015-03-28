class CreateSchedulings < ActiveRecord::Migration
  def change
    create_table :schedulings do |t|
      t.references :room, index: true, foreign_key: true
      t.string :hour
      t.integer :day
      t.timestamps null: false
    end
  end
end
