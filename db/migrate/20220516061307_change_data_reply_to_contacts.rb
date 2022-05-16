class ChangeDataReplyToContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :reply, :text
  end
end
