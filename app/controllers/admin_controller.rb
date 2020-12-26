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

  def showbook
    id = params[:id]
    @book = Book.find(id)
  end

  def searchuser
    @st = "%#{params[:q]}%"
    t = params[:type]
    if t == "email"
      @users = User.where("email like ?", @st)
    end
    if t == "id"
      @users = User.where("id like ?", @st)
    end
  end

  def searchbook
    @st = "%#{params[:q]}%"
    t = params[:type]
    if t == "title"
      @books = Book.where("title like ?", @st)
    end
    if t == "id"
      @books = Book.where("id like ?", @st)
    end
  end

  def updatebook
  end

  def promote
    id = params[:id]
    user = User.find(id)
    user.admin = true
    user.save
    redirect_back(fallback_location: root_path)
  end

  def demote
    id = params[:id]
    user = User.find(id)
    user.admin = false
    user.save
    redirect_back(fallback_location: root_path)
  end

  def enable
    id = params[:id]
    user = User.find(id)
    user.deactivated = false
    user.save
    redirect_back(fallback_location: root_path)
  end

  def disable
    id = params[:id]
    user = User.find(id)
    user.deactivated = true
    user.save
    redirect_back(fallback_location: root_path)
  end

  def deleteuser
    id = params[:id]
    puts "-----delete user #{id}\n"
    user = User.find(id)
    user.destroy
  end

  def book_params
    params.require(:book).permit(:title, :description, :price, :image_url, :genre)
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
