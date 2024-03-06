class LineitemsController < ApplicationController

  
  def index
    @lineitems = Lineitem.all
    @lineitems = @lineitems.all.order(:order_id)
  end

  def new
    @lineitem = Lineitem.new
  end

  def create
    @lineitem = Lineitem.new(lineitem_params)
    @order = @book.orders.build(lineitem_params)
    @lineitems.save
    session[:order_id] = @order.id
  end

  def show
    @lineitem = Lineitem.find(params[:id])
    @order = Order.find(params[:id])
    if @lineitem.book.present?
      @book = @lineitem.book.bname
    else
      # Handle the case where the book is not present (nil)
      @book = "Book not found"
    end

  end

  def edit
    @lineitem = Lineitem.find(params[:id])
  end

  def update
    @lineitem = @lineitem.find(parmas[:id])
    @lineitem.update_attributes(lineitem_params)
  end

  private

  def lineitem_params
    params.require(:lineitem).permit(:book_id, :quantity, :order_id)
  end

end
