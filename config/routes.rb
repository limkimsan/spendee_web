Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, except: [:destroy]
  resources :categories, except: [:show]
  resources :transactions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
