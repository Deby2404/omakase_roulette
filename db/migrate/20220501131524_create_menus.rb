class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :syusyoku, null: false
      t.string :syusai, null: false
      t.string :fukusai, null: false

      t.timestamps
    end
  end
end
