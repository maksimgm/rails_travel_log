Rails.application.routes.draw do
  root 'users#home'

  get "/login", to: "sessions#login", as: "login"

  post "/login", to: "sessions#attempt_login"

  get "/signup", to: "sessions#signup", as: "signup"

  post "/signup", to: "sessions#create"

  delete "/logout", to: "sessions#logout", as: "logout"
  
	resources :users, except: :index do
    resources :trips, only: [:index, :new, :create]
  end

  resources :trips, only:[:edit, :update, :destroy, :show] do
    resources :entries, only: [:new, :create]
  end

  resources :entries, only: [:edit, :update, :destroy]
end
