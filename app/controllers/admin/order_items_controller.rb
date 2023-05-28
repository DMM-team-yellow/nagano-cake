class Admin::OrderItemsController < ApplicationController
  def update
<<<<<<< HEAD
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
=======
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items.all
    if params[:order_item][:product_status] == "in_production"
      @order.update(status: 2)
      @order_item.update(product_status: 2)
    elsif params[:order_item][:product_status] ==  "production_complete"
      @order_item.update(product_status: 3)
      @check = 0
      for item in @order_items do
       if item.product_status == "production_complete"
         next
       else
         @check += 1
       end
      end
      if @check == 0
      @order.update(status: 3)
      end
    end
    redirect_to admin_order_path(@order)
>>>>>>> origin/main
  end

  private
   def order_item_params
     params.require(:order_item).permit(:product_status)
   end
end
