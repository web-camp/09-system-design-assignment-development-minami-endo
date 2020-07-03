Rails.application.routes.draw do
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


  devise_for :admins

  root 'admin/top#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
