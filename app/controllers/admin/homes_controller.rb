class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).per(10)
    @customers = Customer.all
  end
end
