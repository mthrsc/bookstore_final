class DropOrderItemTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :orderitems
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
