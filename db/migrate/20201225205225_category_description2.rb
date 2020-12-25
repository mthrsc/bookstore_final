class CategoryDescription2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :descritpion
  end
end
