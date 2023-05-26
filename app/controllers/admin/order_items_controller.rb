class Admin::OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)

    case order_item.product_status
     when "in_production"
       @order_item.order.update(product_status: "in_production")
     when "production_complete"
       if @order_item.order.order_item.all?{|order_item| order_item.product_status == "production_complete"}
        @order_item.order.update(product_status: "production_complete")
       end
       redirect_to admins_order_path(order_item.order.id)
    end
  end

  private
   def order_item_params
     params.require(:order_item).permit(:product_status)
   end
end
