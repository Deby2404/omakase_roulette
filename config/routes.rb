Rails.application.routes.draw do

  namespace :admin do
    resources :customers, only:[:index,:show]
    resources :genres, only:[:new,:create,:edit,:update,:destroy]
    resources :contacts, only:[:index,:edit,:update,:destroy]
    resources :contacts, only:[:index,:new]
  end
  root to: 'homes#top'

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations:"public/registrations",
    passwords:'public/settings/passwords',
    sessions:"public/sessions",
    omniauth_callbacks:"public/omniauth_callbacks"
  }


  namespace :public do
    get "/customers/my_page" => "customers#show", as: 'my_page' #会員情報詳細ページ（マイページ）表示
    resources :customers, only:[:edit,:update]
    resources :day_randoms, only:[:new,:create,:show]
    resources :menus, only:[:new,:create,:index,:show,:edit,:update,:destroy]
    resources :week_randoms, only:[:new,:create,:show]
    resources :contacts, only:[:new,:create]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe' #退会確認画面
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal' #論理削除用ルーティング
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
