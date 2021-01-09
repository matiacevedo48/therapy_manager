class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :last_name
      t.string :rut
      t.string :phone_number
      t.string :email
      t.string :birthdate
      t.string :job
      t.string :civil_state
      t.text :family_info
      t.string :illness
      t.text :allergies
      t.string :surgery
      t.text :hobbies

      t.timestamps
    end
  end
end
