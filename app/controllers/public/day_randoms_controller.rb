class Public::DayRandomsController < ApplicationController
  def new
    @menus = Menu.all #menuの情報全部取得
    @genres = Genre.all #genreの情報全部取得
  end

  def create
    rand = (ENV['RAILS_ENV'] == "production") ? "RAND()" : "RANDOM()"
    @menu = Menu.order(rand).where(genre_id: random_params[:genre_id]).where(food_status: random_params[:food_status]).limit(1)
    if @menu.present?
      redirect_to public_day_random_path(@menu.ids) #詳細ページに遷移
    else
        @menus = Menu.all #menuの情報全部取得
        @genres = Genre.all #genreの情報全部取得
        render :new
    end
  end

  def show
    # binding.pry
    @menu = Menu.find(params[:id])
    # @menus = Menu.order("RANDOM()").where(genre_id: menu_params[:genre_id]).where(food_status: menu_params[:food_status]).limit(1)

    # @menus = Menu.order("RANDOM()").limit(1)#ランダムなレコードを取得

  end

  private
  def random_params
    params.require(:menu).permit(:food_status, :genre_id)
  end
end