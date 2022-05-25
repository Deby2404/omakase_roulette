class  Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    @contact.notifications.build
    if @contact.save
      flash[:notice] = "送信しました"
      redirect_to root_path
    else
      @contacts = Contact.all
      @customers = Customer.all
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title,:body,:reply)
  end
end
