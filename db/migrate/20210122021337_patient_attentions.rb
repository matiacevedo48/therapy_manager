class PatientAttentions < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_attentions do |t|
      t.references :patient, foreign_key: true
      t.references :attention, foreign_key: true

      t.timestamps
    end
  end
end
