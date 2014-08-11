class ItemsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  layout "internal"
  before_filter :authenticate_user!
  add_breadcrumb "Items", "/items"
  add_breadcrumb "New", "", only: :new
  add_breadcrumb "Edit", "", only: :edit
  add_breadcrumb "Show", "", only: :show
  def permitted_params
    params.permit(:item => [:name, :buy_value, :buy_date, :quantity, :identity])
  end
end
