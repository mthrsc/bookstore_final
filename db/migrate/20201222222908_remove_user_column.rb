class RemoveUserColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :disabled
  end
end
