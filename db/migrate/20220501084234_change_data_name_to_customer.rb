class ChangeDataNameToCustomer < ActiveRecord::Migration[6.1]
  def change
    change_column :customers, :name, :string
  end
end
