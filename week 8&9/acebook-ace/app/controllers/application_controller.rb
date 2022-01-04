class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :set_current_user
  before_action :require_login
  before_action :require_logout

  def set_current_user
      if session[:user_id]
        Current.user = User.find(session[:user_id])
    end
  end 

  def require_login
    if session[:user_id] == nil
      redirect_to root_path, alert: "Must login to access content"
    end 
  end 

  def require_logout
    if session[:user_id] != nil
      redirect_to post_images_path, alert: "Cannot access this page whilst logged in"
    end 
  end 
    
end
