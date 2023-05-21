class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @items = Item.all
    @cart_item = @items.all
  end

  def create
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.quantity += CartItem.new(cart_item_params).quantity
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = current_customer
    @item = Item.all
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end

  def destroy_all
    CartItem.destroy_all
    current_customer.cart_item.destroy_all
    redirect_to cart_item_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :price)
  end

end
