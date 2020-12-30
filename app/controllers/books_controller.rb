class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  $maxPrice = 0.0
  $minPrice = 0.0

  def index
    puts "----- index min: #{$minPrice} --max: #{$maxPrice}"

    @b = Book.all
    @books = Array.new

    if $minPrice == 0.0 && $maxPrice == 0.0
      puts "----- index add all"
      @books = @b
    else
      @b.each do |book|
        puts "----- index  #{book.title} -- #{book.price}"

        if book.price > $minPrice && book.price < $maxPrice
          @books << book
        end
      end
    end
    @categories = Category.all
    $maxPrice = 0.0
    $minPrice = 0.0
  end

  def show
  end

  def new
    @book = Book.new
    @cat = Category.all
  end

  def edit
    @cat = Category.all
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    @book.genre = params[:genre]
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: "Book was successfully destroyed."
  end

  def search
    st = "%#{params[:q]}%"
    @books = Book.where("title like ?", st)
  end

  def pricefilter
    $minPrice = params[:min].to_f
    $maxPrice = params[:max].to_f
    puts "----- pricefilter min: #{$minPrice} --max: #{$maxPrice}"
    redirect_to books_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.require(:book).permit(:title, :description, :price, :image_url, :genre)
  end
end
