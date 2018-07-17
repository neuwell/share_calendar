class AddIndexIdHashToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_index :schedules, [:id_hash], :unique => true
  end
end
