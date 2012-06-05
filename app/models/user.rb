class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation
  
  has_secure_password
  
end
