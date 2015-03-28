class AddWeekToSchedulings < ActiveRecord::Migration
  def change
    add_reference :schedulings, :week, index: true, foreign_key: true
  end
end
