class Public::WeekRandomsController < ApplicationController
  def new
    @menu = Menu.all #menuの情報全部取得
    @genre = Genre.all #genreの情報全部取得
  end

  def create
    @menus ={}
    params[:menus].each{ |key, values|
      @menus[key] = Menu.order("RANDOM()").where(genre_id: values[:genre_id]).where(food_status: values[:food_status]).limit(1)
    }
    render :show
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
    @genre = @menus.genre
  end

  private
  def menu_params
    params.require(:menu).permit(:food_status, :genre_id)
  end
end
