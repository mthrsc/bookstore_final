class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :genre

      t.timestamps
    end
  end
end
