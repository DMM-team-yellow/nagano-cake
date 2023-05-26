class Admin::OrderItemsController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.find(params[:id])
    @order_items = @order.order_items.all
    
  is_updated = true
    if @order_item.update(order_item_params)
       @order.update(stsatus: 2) if @order_item.product_status == "in_production"
       @order_items.each do |order_item|
         if order_item.product_status != "production_complete"
           is_updated = false
         end
      end
      @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_item_path(@order_item)
  end
  private
   def order_item_params
     prams.require(:order_item).permit(:product_status)
   end
end
