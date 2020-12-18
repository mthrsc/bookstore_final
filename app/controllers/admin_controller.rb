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
