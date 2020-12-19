class AdminController < ApplicationController
  before_action :is_admin?

  def index
    if !is_admin?
      redirect_to :controller => :books
    end
  end

  def showuser
    id = params[:id]
    @user = User.find(id)
  end

  def searchuser
    @st = "%#{params[:q]}%"
    @users = User.where("email like ?", @st)
    puts "-----length: #{@users.length()}\n"
  end

  def promote
    id = params[:id]
    user = User.find(id)
    user.admin = true
    user.save
  end

  def demote
    id = params[:id]
    user = User.find(id)
    user.admin = false
    user.save
  end

  def deleteuser
    id = params[:id]
    puts "-----delete user #{id}\n"
    user = User.find(id)
    user.destroy
  end

  protected

  def is_admin?
    if user_signed_in?
      if current_user.admin
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
