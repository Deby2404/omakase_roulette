class Public::MenusController < ApplicationController
  def new
    @menu = Menu.new
    @genre = Genre.all
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.customer_id = current_customer.id
    @menu.save
    redirect_to public_menu_path(id: current_customer)
  end

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
    @genre = Genre.all
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to public_menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to request.referer
  end


  private
   def menu_params
     params.require(:menu).permit(:name,:introduction,:syusyoku,:syusai,:fukusai,:image,:food_status,:genre_id)
   end
end
