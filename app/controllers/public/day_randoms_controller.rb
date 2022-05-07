class Public::DayRandomsController < ApplicationController
  def new
    @menu = Menu.all #menuの情報全部取得
    @genre = Genre.all #genreの情報全部取得
  end

  def create
    fs = params[:food_status]
    @menu = Menu.where("food_status = #{fs}")
    
    #レコードの取得
    redirect_to public_day_random_path(@menu) #詳細ページに遷移
  end

  def show
    @menus = Menu.includes(:customer).sample(1)#ランダムなレコードを取得
  end
end
 #new画面でfood_statusとgenreを選択
 #おまかせボタンを押してcreate
 #全メニュー取得
 #選択したfood_statusのレコードを取得
 #選択したgenreのレコードを取得
 #選択した特定のfood_statusとgenreがあるレコードの取得
 #取得した中からランダムで詳細ページに表示