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
      redirect_to admin_items_path(@item)
     else
      render :new
     end
  end

  def show
    @item = Item.find(params[:id])  
  end

  def edit
  end

  def update
  end
  
  
   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_sold_out)
  end
  
end
