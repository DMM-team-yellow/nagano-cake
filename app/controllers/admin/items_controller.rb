class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to admin_items_path
     else
      @items = Item.all
      render 'index'
     end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  
   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :price, :is_sold_out)
  end
  
end
