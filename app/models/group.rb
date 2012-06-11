class Group < ActiveRecord::Base
  attr_accessible :contact_id, :name, :user_id
  
  # belongs_to :user
  # has_many :contacts
end
