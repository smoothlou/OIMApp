class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :nickname, :job_title, :phone, :email, :twitter, :address, :city, :state, :zip, :we_met_at, :we_met_on, :we_chatted_about, :adjective, :group
  
  validates_presence_of :first_name, :last_name
  
  has_many :stories  

end
