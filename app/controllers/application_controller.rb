class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_actionを設定
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def index
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
