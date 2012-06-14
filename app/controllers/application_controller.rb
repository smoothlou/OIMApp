class ApplicationController < ActionController::Base
  protect_from_forgery

 helper_method :current_user

  def current_user
    @user = User.find_by_id(session[:userid])
  end
  

end
