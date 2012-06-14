class Group < ActiveRecord::Base
  attr_accessible :contact_id, :name, :user_id
  
  
  has_many :contacts
  
  # belongs_to :user
  # has_many :contacts
end
