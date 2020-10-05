Rails.application.routes.draw do
  get 'memo/index'
  get 'products/index'
  devise_for :users
  root to: 'schedules#index'
  resources :schedules, only: [:index, :destroy] do
    resources :memos, only: [:index,:new,:create,:destroy]
    resources :meetings 
  end
  resources :clients, only: [:index, :new, :create, :show, :edit, :update] do
    resources :purchasers, only: [:new, :create]
  end
  
  resources :work_times, only: [:index, :new, :create]

  resources :products, only: [:index, :new, :create,:edit,:update]

  
end
