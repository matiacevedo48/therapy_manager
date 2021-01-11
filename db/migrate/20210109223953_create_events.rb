class CreateEvents < ActiveRecord::Migration[6.0]
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
