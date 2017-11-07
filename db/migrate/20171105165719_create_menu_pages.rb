class CreateMenuPages < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_pages do |t|
      t.integer :menu_id
      t.integer :page_number
      t.string :image_id
      t.integer :full_height
      t.integer :full_width
      t.string :uuid

    end
  end
end
