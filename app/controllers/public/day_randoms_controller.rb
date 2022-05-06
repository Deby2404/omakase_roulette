class Public::DayRandomsController < ApplicationController
  def new
    @menu = Menu.all #menuの情報全部取得
    @genre = Genre.all #genreの情報全部取得
  end

  def create
    @menu = Menu.find(params[:id]) #レコードの取得
    redirect_to public_day_random_path #詳細ページに遷移
  end

  def show
    @random = Menu.order("RANDOM()").first #ランダムなレコードを取得
  end
end
 #new画面でfood_statusとgenreを選択
 #おまかせボタンを押してcreate
 #全メニュー取得
 #選択したfood_statusのレコードを取得
 #選択したgenreのレコードを取得
 #選択した特定のfood_statusとgenreがあるレコードの取得
 #取得した中からランダムで詳細ページに表示