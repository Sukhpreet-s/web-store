Rails.application.routes.draw do
  root 'products#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :products
end
