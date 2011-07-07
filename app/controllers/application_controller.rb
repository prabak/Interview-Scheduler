class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  def current_user
    return @current_user if defined? @current_user
    @current_user = User.where("email = ? ANd token = ?",session[:email], session[:password]).first
  end
  
  private
  
  def require_user_session
    unless current_user
      flash[:error] = "Email/Password provided is not valid."
      redirect_to root_path
      return false
    end
  end
  
end
