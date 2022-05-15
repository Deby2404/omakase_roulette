class ChangeDataBodyToContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :body, :text
  end
end
