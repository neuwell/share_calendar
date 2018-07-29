class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :id_hash
      t.integer :year
      t.integer :month
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
