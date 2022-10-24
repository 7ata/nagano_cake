Rails.application.routes.draw do
   # 会員側のルーティング設定
   root to: "public/homes#top"
   get "about" => "public/homes#about", as: "about"
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
  devise_for :customers, controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
