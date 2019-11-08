Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'root#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :books, except: [:show]

  namespace :api do
    namespace :v1 do
      resource :login, only: [:create]
      resources :books, only: [:index, :show, :create]
    end
  end

end
