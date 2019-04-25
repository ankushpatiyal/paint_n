class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me, :name, :phone, :country, :city, :about]
    devise_parameter_sanitizer.permit :account_update, keys: [:username, :email, :password, :password_confirmation, :remember_me, :name, :phone, :country, :city, :about]
  end

end
