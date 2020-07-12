Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: "public/customers/sessions",
    registrations: "public/customers/registrations"
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :public do
    resources :orders, only:[:comfirm, :new, :completed, :create, :index, :show]
  end

  namespace :public do
    resources :cart_products, only:[:index, :update, :destroy, :create]
    delete '/cart_products', to: 'cart_products#destroy_all', as: "cart_product_destroy_all"
  end

  namespace :public do
    resources :products, only:[:index, :show, :top]
    root 'customers#top'
  end

  namespace :public do
    resources :customers, only:[:edit, :show, :update, :unsubscribe, :withdraw]
  end

  namespace :public do
    resources :shipping_addresses, only:[:edit, :index, :update, :create, :destroy]
  end

  namespace :admins do
  	resources :order_products, only:[:update]
  end

  namespace :admins do
  	resources :orders, only:[:index, :show, :update]
  end

  namespace :admins do
  	resources :customers, only:[:index, :show, :edit, :update]
  end

  namespace :admins do
  	resources :products, only:[:index, :new, :create, :show, :edit, :update]
  end

  namespace :admins do
  	resources :genres, only:[:index, :create, :edit, :update]
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
