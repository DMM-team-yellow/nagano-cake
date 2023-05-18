class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @cart_item = CartItem.new
  end
end
