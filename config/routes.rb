Rails.application.routes.draw do
  devise_for :admins
  get 'products/index'
  devise_for :users
  resources :schedules, only: [:index,:new,:create] 
  resources :work_times, only: [:index, :create]
  resources :leave_times, only: [:index, :create]
  get "users/show" => "users#show"
  root to: 'meetings#index'
  resources :meetings 
  resources :clients, only: [:index, :new, :create, :show, :edit, :update] do
    resources :purchasers, only: [:new,:create,:edit,:update,:destroy]
  end
  resources :products

  
end
