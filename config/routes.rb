Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'root#index'

  resources :books, except: [:show]

  resource :health_check, only: [:show]

end
