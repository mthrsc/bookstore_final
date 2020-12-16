class CartController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def add
    # get the Id of the product
    id = params[:id]
    # if the cart is already been created, use existing cart else create a blank cart
    if session[:cart]
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    #If the product is already added it increments by 1 else product set to 1
    if cart[id]
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end
    redirect_to :action => :index
  end

  def decrease
    id = params[:id]
    cart = session[:cart]
    cart[id] = cart[id] - 1
    redirect_to :action => :index
  end

  def increase
    id = params[:id]
    cart = session[:cart]
    cart[id] = cart[id] + 1
    redirect_to :action => :index
  end

  def clear
    #sets session variable to nil and bring back to index
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    # passes a cart to display
    if session[:cart]
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :action => :index
  end

  def createOrder
    # Step 1: Get the currentuser
    @user = User.find(current_user.id)

    # Step 2: Create a new order and associate it with the current user
    @order = @user.orders.build(:order_date => DateTime.now, :status => "Pending")
    @order.save

    # Step 3: For each book in the cart, create a new book on the order!!
    @cart = session[:cart] || {} # Get the content of the Cart
    @cart.each do |id, quantity|
      book = Book.find_by_id(id)
      @orderbooks = @order.orderbooks.build(:book_id => book.id, :title => book.title, :description => book.description, :quantity => quantity, :price => book.price)
      @orderbooks.save
    end
    redirect_to "/createOrder/"
  end
end
