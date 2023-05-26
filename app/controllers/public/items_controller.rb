class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @item.where!(is_sold_out: 'false')
    @items = Item.page(params[:page]).per(8)
    @items.where!(is_sold_out: 'false')
    @genres = Genre.all
    
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @genre_items = @genre.items.where(is_sold_out: 'false')
      @items = @genre.items.where(is_sold_out: 'false').page(params[:page]).per(8)
      render :genre_result
    end
  end

  def show
    @item = Item.find(params[:id]) 
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  
  
end
