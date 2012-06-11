class RemoveGroupFromContact < ActiveRecord::Migration
  def up
    remove_column :contacts, :group
      end

  def down
    remove_column :contacts, :group, :string
  end
end
