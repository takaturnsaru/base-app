Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  root to: 'schedules#index'
  resources :schedules, only: [:index, :destroy] do
    resources :meetings 
  end
  resources :clients, only: [:index, :new, :create, :show, :edit, :update] do
    resources :purchasers, only: [:new, :create]
  end
  

  resources :products, only: [:index, :new, :create,:edit,:update]
  
end
