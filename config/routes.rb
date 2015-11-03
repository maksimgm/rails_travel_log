Rails.application.routes.draw do
  get "/login", to: "sessions#login", as: "login"

  post "/login", to: "sessions#attempt_login"

  get "/signup", to: "sessions#signup", as: "signup"

  post "/signup", to: "sessions#create"

  delete "/logout", to: "sessions#logout", as: "logout"
  
	resources :users do
    resources :trips do
      resources :entries
    end
  end
end
