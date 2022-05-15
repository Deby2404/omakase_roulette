class ChangeGenreIdToMenus < ActiveRecord::Migration[6.1]
  def change
    change_column :menus, :genre_id, :integer, null: false
  end
end
