class AddColumnsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    add_column :contacts, :nickname, :string
    add_column :contacts, :job_title, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :email, :string
    add_column :contacts, :twitter, :string
    add_column :contacts, :address, :string
    add_column :contacts, :city, :string
    add_column :contacts, :state, :string
    add_column :contacts, :zip, :string
    add_column :contacts, :we_met_at, :string
    add_column :contacts, :we_met_on, :string
    add_column :contacts, :we_chatted_about, :string
    add_column :contacts, :adjective, :string
  end
end
