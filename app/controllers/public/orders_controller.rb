class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = Customer.all
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to 
    
  end
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def confirmation
    @order = Order.find(params[:id])
  end
  
  def completion
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method)
  end
end