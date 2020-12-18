class UserController < ApplicationController
  def login
    session[:login] = 1
    flash[:notice] = "Admin Login sucessfull!!"
    if current_user.admin == false
      redirect_to :controller => :books
    elsif current_user.admin == true
      redirect_to :controller => :admin
    end
  end

  def logout
    session[:login] = nil
    flash[:notice] = "You have been successfully logged out!!"
    redirect_to :controller => :books
  end
end
