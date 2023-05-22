class Public::OrdersController < ApplicationController
  def new #注文情報入力画面
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm #注文情報確認画面
    @order = Order.new(order_params)
      #現在の顧客に登録されている住所であれば
    if params[:order][:address_option] == "0"
      @order.ship_postcode = current_customer.postcode
      @order.ship_address = current_customer.address
      @order.ship_name = current_customer.last_name + current_customer.first_name
      #新規住所入力ならば
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:customer_id])
      @order.ship_postcode = ship.postcode
      @order.ship_address = ship.address
      @order.ship_name = ship.name
      #登録済住所から選択するならば
    elsif params[:order][:address_option] == "2"
      @order.ship_postcode = params[:order][:ship_postcode]
      @order.ship_address = params[:order][:shipping_address]
      @order.ship_name = params[:order][:ship_name]
    else
      render 'new'
    end
      @cart_items = current_customer.cart_items.all
      @order.customer_id = current_customer.id
  end

  def complete #注文完了画面
  end

  def create
  end

  def index
  end

  def show
  end

private
  def order_params
    params.require(:order).permit(:customer_id,:status,:ship_name,:ship_postcode,:ship_address,:shipping_fee,:payment_method,:total_price)
  end
end
