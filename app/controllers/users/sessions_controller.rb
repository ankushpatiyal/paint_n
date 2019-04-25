# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    resource
    self.resource = resource_class.new(sign_in_params)
    resource.login = sign_in_params[:login]
    clean_up_passwords(resource)
    yield resource if block_given?
    # respond_with(resource, serialize_options(resource))
    @paintings = ActiveStorage::Attachment.where(name: "paintings").where(show: true)
    render 'welcome/index', locals: {resource: resource}
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
    redirect_to profile_path(resource)
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
