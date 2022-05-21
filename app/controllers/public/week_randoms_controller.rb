class Public::WeekRandomsController < ApplicationController
  def new
    @menus = Menu.all #menuの情報全部取得
    @genres = Genre.all #genreの情報全部取得
  end

  def create
    @menu ={}
    params[:menus].each{ |key, values|
      @menu[key] = Menu.order("RANDOM()").where(genre_id: values[:genre_id]).where(food_status: values[:food_status]).limit(1)
    }
    if @menu.present?
      redirect_to public_week_random_path(@menu.id) #詳細ページに遷移
    else
        @menus = Menu.all #menuの情報全部取得
        @genres = Genre.all #genreの情報全部取得
        render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @genres = @menu.genre
  end

  private
  def random_params
    params.require(:menu).permit(:food_status, :genre_id)
  end
end
