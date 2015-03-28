class AddUserToScheduling < ActiveRecord::Migration
  def change
    add_reference :schedulings, :user, index: true, foreign_key: true
  end
end
