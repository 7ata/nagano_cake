Rails.application.routes.draw do
   # 会員側のルーティング設定
   root to: "public/homes#top"
   get "about" => "public/homes#about", as: "about"
   resources :items, only:[:index,:show]
   resources :orders, only:[:new,:confirm,:complete,:index,:show]
   resources :cart_items, only:[:index,:update,:destroy,:destroy_all,:create]
   resources :customers, only: [:show,:edit, :update, :unsubscribe,:withdraw]
   resources :addresses, only: [:index,:edit,:create,:update,:destroy]
   # 管理者側のルーティング設定
  namespace :admin do
    get '/' =>'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit,:update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only:[:new, :confirm, :complete, :index, :show]
    resources :cart_items, only:[:update]
    resources :making_status, only:[:update]
  end
  devise_for :customers,skip: [:passwords],controllers: {
      sessions:      'public/sessions',
      registrations: 'public/registrations'
  }
  devise_for :admin,skip: [:passwords,:registrations], controllers: {
      sessions:      'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
