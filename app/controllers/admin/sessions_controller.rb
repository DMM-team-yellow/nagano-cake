# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #def new
  #end

  # POST /resource/sign_in
  #def create
   # @admin = login(params[:email],params[:password])
    #if admin
     # redirect_to admin_items_path
    #else
     # render :new
    #end
  #end

  # DELETE /resource/sign_out
  #def destroy
    #logout
    #redirect_to new_admin_session_path
  #end


  def after_sign_in_path_for(resource)
    admin_admin_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
