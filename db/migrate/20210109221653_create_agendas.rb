class CreateAgendas < ActiveRecord::Migration[6.0]
  def change
    create_table :agendas do |t|
      t.string :available
      t.string :taken
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
