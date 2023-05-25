Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者用
  # URL / admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items,:customers,:orders
    
  end

  scope module: :public do
    resources :items, only: [:index,:show]
    resources :orders
    
    post 'orders/confirmation' => 'orders#confirmation'
    get 'completion' => 'orders#completion'
    
    patch 'customers/out' => 'customers#out', as: 'out'
    resources :customers, except:[:show,:index,:edit]
    
    get 'my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'withdrawal' => 'customers#withdrawal'
    
  
    resources :cart_items, only: [:index,:create,:update,:destroy] do
      collection do
        delete "all_destroy"
      end
    end
    
    get 'about' => 'homes#about'
  end

  root to:'public/homes#top'
  get 'admin' => 'admin/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end