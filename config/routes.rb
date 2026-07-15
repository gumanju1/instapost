Rails.application.routes.draw do
  root "posts#index"

  resources :users, only: [ :new, :create, :show ]

  resources :posts do
    resources :comments
    resources :upvotes, only: :create, controller: "posts/upvotes"
    resources :downvotes, only: :create, controller: "posts/downvotes"
  end

  resources :sessions, only: [ :new, :create, :destroy ]

  get "signup", to: "users#new", as: "signup"
  post "signup", to: "users#create"

  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy"
end
