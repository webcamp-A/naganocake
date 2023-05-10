Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "admin/sessions"
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
    resources :cart_items,:orders
    resources :customers,except:[:index]
  end

  root to:'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'customers' => 'public/customers#show'
  get 'withdrawal' => 'public/customers#withdrawal'
  post 'orders/confirmation' => 'public/orders#confirmation'
  get 'orders/completion' => 'public/orders#completion'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end