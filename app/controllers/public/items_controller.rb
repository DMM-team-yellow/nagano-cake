class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @item = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id]) 
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  
  
end
