class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
<<<<<<< HEAD
    order = Order.find(params[:id])
    order_items = order.order_items
    order.update(order_params)
    if order.status == "0 or 1"
      order_items.update_all(product_status: "1")
=======
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    if @order.status = 1
      @order_items.each do |order_item|
      order_item.product_status = 1
      order_item.save
    end
>>>>>>> origin/main
    end
     redirect_to request.referer
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
