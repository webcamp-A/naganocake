class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.addressee = current_customer.last_name + current_customer.first_name
  end

  def confirmation
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.addressee = current_customer.last_name + current_customer.first_name
    @cart_items = current_customer.cart_items.all
    @customer = Customer.find(current_customer.id)
  end

  def completion
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postal_code = current_customer.postal_code
    if @order.save
      redirect_to completion_path
    else
      render :new
    end
    
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.quantity = cart_item.amount
      @order_detail.unit_price = (cart_item.item.price*1.1).floor
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:postage,:customer_id,:address,:postal_code,:addressee,:payment)
  end

end