class Public::CustomersController < ApplicationController

  def show
    @menus = Menu.page(params[:page])
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customers_my_page_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
