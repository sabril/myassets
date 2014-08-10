class ItemsController < ApplicationController
  inherit_resources
  layout "internal"
  before_filter :authenticate_user!
  def permitted_params
    params.permit(:item => [:name, :buy_value, :buy_date])
  end
end
