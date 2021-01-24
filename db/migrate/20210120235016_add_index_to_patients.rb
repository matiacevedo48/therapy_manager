class AddIndexToPatients < ActiveRecord::Migration[6.0]
  def change
    add_index :patients, :rut
    add_index :patients, :last_name
  end
end
