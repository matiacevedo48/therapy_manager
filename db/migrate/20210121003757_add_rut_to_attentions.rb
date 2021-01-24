class AddRutToAttentions < ActiveRecord::Migration[6.0]
  def change
    add_reference :attentions, :patients, null: true, foreign_key: true
  end
end
