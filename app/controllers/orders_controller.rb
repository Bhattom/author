class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @orders = Order.all  
    @books = Book.all  
    
  end

  def new
    @order = Order.new
    @books = Book.all
  end

  def edit
  end

  def create
    @order = Order.new
    p 88888888
    p params[:book_ids]
    params[:book_ids].each do |b|
      @order.lineitems.new(book_id: b)
    end
    if @order.save!
      redirect_to order_path(@order)
    else
      redirect_to orders_path
    end
  end


  def show
    @order = Order.find(params[:id])
  end

  def show_by_books
    @orders = Order.where(book_id: params[:book_ids])
    render 'show'
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :bname , book_ids: [])
  end
end
