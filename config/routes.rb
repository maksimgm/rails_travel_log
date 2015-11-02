Rails.application.routes.draw do
  
	resources :users do
    resources :trips do
      resources :entries
    end
  end
end
