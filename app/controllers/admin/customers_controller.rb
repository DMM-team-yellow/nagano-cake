class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.page(params[:page])
  end

  def show
   @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

end
