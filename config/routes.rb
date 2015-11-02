Rails.application.routes.draw do
  
  get 'entries/index'

  get 'entries/new'

  get 'entries/edit'

  root 'users#index'

  resources :users do
    resources :trips do
      resources :entries
    end
  end
end
