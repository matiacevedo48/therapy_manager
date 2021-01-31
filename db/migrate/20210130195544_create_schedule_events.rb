class CreateScheduleEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_events do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
