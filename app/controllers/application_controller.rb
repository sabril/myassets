class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?
  layout :layout_by_resource
  add_breadcrumb "Dashboard", :root_path
  def layout_by_resource
    unless devise_controller?
      "application"
    else
      "full"
    end
  end
  
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :phone, :title, :email, :password, :current_password, :password_confirmation, :hospital_id)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:first_name, :last_name, :phone, :title, :email, :password, :current_password, :password_confirmation, :hospital_id)}
  end
end
