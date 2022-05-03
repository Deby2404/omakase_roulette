class AddColumnToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :food_status, :integer, default: 0, null: false
  end
end
