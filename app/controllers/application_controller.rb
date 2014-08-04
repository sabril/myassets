class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  def layout_by_resource
    unless devise_controller?
      "application"
    else
      "full"
    end
  end
end
