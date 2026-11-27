Rails.application.routes.draw do
  get "top/index"
  root "sessions#new"

  resources :users, only: [:index, :new, :create]

  resources :support_requests, only: [:index, :new, :create] do
    member do
      get :complete
    end
  end

  get "staff/dashboard", to: "staff#dashboard", as: :staff_dashboard

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "up" => "rails/health#show", as: :rails_health_check
end
