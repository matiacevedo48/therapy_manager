class RenameOldTableToNewTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :sessions, :attentions
  end
end
