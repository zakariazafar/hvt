class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.integer :menu_page_id
      t.string :price
      t.string :high_price
      t.integer :dish_id
      t.string :xpos
      t.string :ypos

      t.timestamps
    end
  end
end
