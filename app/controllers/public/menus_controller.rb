class Public::MenusController < ApplicationController
  def new
    @menu = Menu.new
    @genre = Genre.all
  end

  def create
    @menu = Menu.new(menu_params)
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
  end

  private
   def menu_params
     params.require(:menu).permit(:name,:introduction,:syusyoku,:syusai,:fukusai,:image)
   end
end
