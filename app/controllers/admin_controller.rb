class AdminController < ApplicationController
  before_action :is_admin?

  def index
    if !is_admin?
      redirect_to :controller => :books
    end
  end

  def manage_users
  end

  def manage_books
  end

  def searchuser
    st = "%#{params[:q]}%"
    @users = User.where("email like ?", st)
    puts "-----length: #{@users.length()}\n"
  end

  def makeadmin
  end

  def deleteuser
    id = params[:id]
    puts "-----delete user #{id}\n"
    user = User.find(id)
    user.destroy
    searchuser(@search_term)
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
