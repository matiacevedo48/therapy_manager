class CreateSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :specialties do |t|

      t.timestamps
    end
  end
end
