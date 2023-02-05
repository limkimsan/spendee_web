Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      scope :users, module: :users do
        post '/', to: "registrations#create", as: :user_registration
      end
      resources :transactions
      resources :categories, only: [:index]
    end
  end
end