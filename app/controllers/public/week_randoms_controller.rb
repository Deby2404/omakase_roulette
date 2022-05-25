class Public::WeekRandomsController < ApplicationController
  def new
    @menus = Menu.all
    @genres = Genre.all
  end

  def create
    rand = (ENV['RAILS_ENV'] == "production") ? "RAND()" : "RANDOM()" #MySQLとSQLlight
    @menu ={}
    params[:menus].each do |key, values|
      @menu[key] = Menu.order(rand).where(genre_id: values[:genre_id]).where(food_status: values[:food_status]).limit(1)
    end

    check_flg = true
    w_names = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']
    w_names.each do |w_name|
      if @menu[w_name].blank?
        check_flg = false
      end
    end

    if check_flg
      render :show
    else
      @genres = Genre.all
      flash.now[:alert] = "全てのジャンルを選択して下さい"
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
