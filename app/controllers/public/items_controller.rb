class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def index
    @items = Item.all.page(params[:page]).per(8)
    @items_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private

  def item_params
    params.require(:items).permit(:name, :introduction, :price, :item)
  end

end