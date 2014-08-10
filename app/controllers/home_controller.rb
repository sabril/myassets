class HomeController < ApplicationController
  def index
    redirect_to dashboard_path if current_user
  end
  
  def dashboard
    render layout: "internal"
  end
end
