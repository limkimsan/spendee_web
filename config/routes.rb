Rails.application.routes.draw do
  root 'pages#home'
  resources :users, except: [:destroy]
  resources :categories, except: [:show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
