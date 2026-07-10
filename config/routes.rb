Rails.application.routes.draw do
  root "posts#index"

  resources :users
  resources :posts
  resources :sessions, only: [ :new, :create, :destroy ]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy"
end
