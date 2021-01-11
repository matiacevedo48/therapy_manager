class AddFieldsToSpecialties < ActiveRecord::Migration[6.0]
  def change
    add_column :specialties, :name, :string
  end
end
