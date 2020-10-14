Rails.application.routes.draw do
  devise_for :admins
  get 'products/index'
  devise_for :users
  get "users/show" => "users#show"
  root to: 'meetings#index'
  resources :meetings 
  resources :clients, only: [:index, :new, :create, :show, :edit, :update] do
    resources :purchasers, only: [:new,:create,:edit,:update,:destroy]
  end
  
  resources :work_times, only: [:index, :new, :create]

  resources :products, only: [:index, :new, :create,:edit,:update]

  
end
