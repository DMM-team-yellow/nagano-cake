# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @customers = Customer.new
  end

  # POST /resource/sign_in
  def create
  end

  # DELETE /resource/sign_out
  def destroy
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :password)
  end


end