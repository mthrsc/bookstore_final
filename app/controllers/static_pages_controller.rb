class StaticPagesController < ApplicationController
  def home
    temp = Book.order("created_at DESC")
    @books = Array.new(5)
    i = 0
    loop do
      @books[i] = temp[i]
      i += 1
      if i == @books.length()
        break
      end
    end
  end

  def category
    @catName = params[:title]
    @books = Book.where("genre like ? ", @catName)
  end
end
