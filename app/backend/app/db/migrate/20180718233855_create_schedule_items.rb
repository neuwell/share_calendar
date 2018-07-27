class CreateScheduleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_items do |t|
      t.references :schedule, foreign_key: true
      t.string :date
      t.string :memo
      t.string :color

      t.timestamps
    end
  end
end
