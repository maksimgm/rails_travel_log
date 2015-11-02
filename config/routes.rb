Rails.application.routes.draw do

root 'users#home'
  
	resources :users do
    resources :trips do
      resources :entries
    end
  end
end
