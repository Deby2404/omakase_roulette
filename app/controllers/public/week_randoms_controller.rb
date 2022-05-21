class Public::WeekRandomsController < ApplicationController
  def new
    @menus = Menu.all #menuの情報全部取得
    @genres = Genre.all #genreの情報全部取得
  end

  def create
    rand = (ENV['RAILS_ENV'] == "production") ? "RAND()" : "RANDOM()" #MySQLとSQLlightでは書き方が違ってくる
    @menu ={}
    params[:menus].each do |key, values|
      @menu[key] = Menu.order(rand).where(genre_id: values[:genre_id]).where(food_status: values[:food_status]).limit(1)
    end

    check_flg = true
    w_names = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
    w_names.each do |w_name|
      if @menu[w_name].blank? #@menuのnameがblenkだったらfalseを返す
        check_flg = false
      end
    end

    if check_flg
      render :show
    else
      # @menus = Menu.all
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
