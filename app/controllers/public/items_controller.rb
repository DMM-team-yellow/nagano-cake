class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @item = Item.all
    @item.where!(is_sold_out: 'false')
    @items = Item.page(params[:page]).per(8)
    @items.where!(is_sold_out: 'false')
  end

  def show
    @item = Item.find(params[:id]) 
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  
  
end
