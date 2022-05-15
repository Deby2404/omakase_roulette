class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @menus = @customer.menus.page(params[:page])
  end

end
