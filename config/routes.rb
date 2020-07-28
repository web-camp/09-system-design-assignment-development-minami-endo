Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: "public/customers/sessions",
    registrations: "public/customers/registrations"
  }


  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :public do
    get '/orders/completed', to: 'orders#completed'
    post '/orders/comfirm', to: 'orders#comfirm', as: "orders_comfirm"
    resources :orders, only:[:new, :create, :index, :show]
  end

  namespace :public do
    resources :cart_products, only:[:index, :update, :destroy, :create]
    delete '/cart_products', to: 'cart_products#destroy_all', as: "cart_product_destroy_all"
  end

  namespace :public do
    resources :products, only:[:index, :show, :top]
    get '/products/genre_search', to: 'products#genre_search'

  end

  namespace :public do
    resources :customers, only:[:edit, :update]
    get '/customers/unsubscribe', to: 'customers#unsubscribe'
    patch '/customers/withdraw', to: 'customers#withdraw'
    get '/customers/my_page', to: 'customers#show'
  end

  namespace :public do
    resources :shipping_addresses, only:[:edit, :index, :update, :create, :destroy]
    get '/shipping_addresses', to: 'shipping_addresses#index', as: "shipping_addresses_index"
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
    get '/top', to: 'products#top'

  end

  namespace :admins do
  	resources :genres, only:[:index, :create, :edit, :update]
  end

  root 'public/products#top'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
