Rails.application.routes.draw do
  get "/login", to: "users#login", as: "login"

  post "/login", to: "users#attempt_login"

  get "/signup", to: "users#signup", as: "signup"

  post "/signup", to: "users#create"

  delete "/logout", to: "users#logout", as: "logout"
  
	resources :users do
    resources :trips do
      resources :entries
    end
  end
end
