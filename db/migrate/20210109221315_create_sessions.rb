class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :therapy
      t.text :treatment
      t.date :date
      t.time :time
      t.text :symptom

      t.timestamps
    end
  end
end
