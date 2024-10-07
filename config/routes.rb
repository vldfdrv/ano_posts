Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  resources :users
  resources :posts do
    collection do
      get "my_drafts"
    end
    member do
      get "approve_or_reject"
    end
  end

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
