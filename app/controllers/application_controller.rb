class ApplicationController < ActionController::Base
  
  protect_from_forgery
 
 layout :user

  protected
  
  def user
    if session[:user_id].blank?
      "public"
    else
      "login"
    end
    
  end
  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_filter
    else
      @@me=User.find(session[:user_id])
      return true
    end
  end
  
  
end
