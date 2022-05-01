class AddNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :name, :integer, null: false

  end
end
