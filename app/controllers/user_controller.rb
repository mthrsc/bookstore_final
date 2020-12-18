class UserController < ApplicationController
  def index
  end

  def login
    session[:login] = 1
    flash[:notice] = "Admin Login sucessfull!!"
    redirect_to :controller => :books
  end

  def logout
    session[:login] = nil
    flash[:notice] = "You have been successfully logged out!!"
    redirect_to :controller => :books
  end
end
