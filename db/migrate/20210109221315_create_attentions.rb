class CreateAttentions < ActiveRecord::Migration[6.0]
  def change
    create_table :attentions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true
      t.text :treatment
      t.date :date
      t.time :time
      t.text :symptom

      t.timestamps
    end
  end
end
