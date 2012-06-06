class AddGroupsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :group, :string
  end
end
