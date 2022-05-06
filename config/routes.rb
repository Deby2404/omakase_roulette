Rails.application.routes.draw do


  namespace :admin do
    get 'contacts/index'
  end
  get 'contacts/new'
  namespace :admin do
    get 'homes/top'
    resources :customers, only:[:index,:show,:edit]
    resources :genres, only:[:new,:create,:edit,:update,:destroy]
    resources :contacts, only:[:index,:edit,:update,:destroy]
  end
  root to: 'homes#top'

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations:"public/registrations",
    sessions:"public/sessions"
  }

  namespace :public do
    get "/customers/my_page" => "customers#show" #会員情報詳細ページ（マイページ）表示
    resources :customers, only:[:edit,:update]
    resources :menus, only:[:new,:create,:index,:show,:edit,:update,:destroy]
    resources :day_randoms, only:[:new,:create,:show]
    resources :week_randoms, only:[:new,:create,:show]
    resources :contacts, only:[:new,:create]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe' #退会確認画面
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal' #論理削除用ルーティング
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
