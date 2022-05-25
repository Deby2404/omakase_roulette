class Public::DayRandomsController < ApplicationController
  def new
    @menus = Menu.all
    @genres = Genre.all
  end

  def create
    rand = (ENV['RAILS_ENV'] == "production") ? "RAND()" : "RANDOM()"
    @menu = Menu.order(rand).where(genre_id: random_params[:genre_id]).where(food_status: random_params[:food_status]).limit(1)
    if @menu.present?
      redirect_to public_day_random_path(@menu.ids)
    else
      @menus = Menu.all
      @genres = Genre.all
      flash.now[:alert] = "ジャンルを選択して下さい"
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  private
  def random_params
    params.require(:menu).permit(:food_status, :genre_id)
  end
end