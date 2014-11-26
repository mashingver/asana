class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :title
      t.float :length
      t.float :width
      t.float :thickness
      t.float :diameter
      t.float :capacity
      t.float :weight
      t.string :color
      t.string :material
      t.string :extender
      t.string :manufacturer
      t.text :description
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
