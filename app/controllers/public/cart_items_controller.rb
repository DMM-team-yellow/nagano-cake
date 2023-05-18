class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:increase,:decrease,:destroy]
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
end
