class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path(@address)
    else
      render "index"
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path(@address)
    else
      render "edit"
    end
  end

  def destroy
    @address = Adress.find(params[:id])
    @address.destroy
    redirect_to addresses_path(@address)
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end
end
