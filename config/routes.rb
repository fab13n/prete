Rails.application.routes.draw do
  root to: "home#index"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :loans
  resources :goods

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
