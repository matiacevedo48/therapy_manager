class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    
      remove_column :patients, :user_id
    
  end
end
