Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'root#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :books, except: [:show]

  resource :health_check, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
    end
  end

end
