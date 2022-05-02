Rails.application.routes.draw do


  namespace :admin do
    get 'homes/top'
    resources :customers, only:[:index,:show,:edit]
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
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
