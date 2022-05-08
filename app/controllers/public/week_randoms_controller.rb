class Public::WeekRandomsController < ApplicationController
  def new
    @menu = Menu.all #menuの情報全部取得
    @genre = Genre.all #genreの情報全部取得
  end

  def create
    @menus = Menu.order("RANDOM()").where(genre_id: menu_params[:genre_id]).where(food_status: menu_params[:food_status]).limit(1)
    if @menus.present?
      redirect_to public_week_random_path(@menus.ids) #詳細ページに遷移
    else
        @menu = Menu.all #menuの情報全部取得
        @genre = Genre.all #genreの情報全部取得
        render :new
    end
  end

  def show
    @menus = Menu.find(params[:id])
  end

  private
  def menu_params
    params.require(:menu).permit(:food_status, :genre_id)
  end
end
