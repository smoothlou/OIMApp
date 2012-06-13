class AddPhotosToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :photo_file_name, :string
    add_column :contacts, :photo_content_type, :string
    add_column :contacts, :photo_file_size, :integer
  end
end
