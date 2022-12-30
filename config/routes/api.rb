Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope :users, module: :users do
        post '/', to: "registrations#create", as: :user_registration
      end
      resources :transactions
    end
  end
end