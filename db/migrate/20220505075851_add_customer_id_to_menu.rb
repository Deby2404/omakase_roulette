class AddCustomerIdToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :customer_id, :integer, null: false
  end
end
