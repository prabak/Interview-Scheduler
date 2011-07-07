class SessionsController < ApplicationController

  before_filter :require_user_session, :except => [:new, :create, :destroy]
  
  def new
  end

  def create
    session[:email]    = params[:email]
    session[:password] = params[:password]
    
    redirect_to appointments_path
  end
  
  def destroy
    session[:email]    = nil
    session[:password] = nil
    redirect_to root_path
  end


end
