Rails.application.routes.draw do
  get "top/index"
  root "top#index"

  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "up" => "rails/health#show", as: :rails_health_check
end
