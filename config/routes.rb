Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'root#index'

  devise_for :users, {
    path: '',
    path_names: {
      sign_up: '',
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup',
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
    },
  }

  resources :books, except: [:show]
  resources :users, except: [:show]

  namespace :api do
    namespace :v1 do
      resource :login, only: [:create]
      resources :books, only: [:index, :show, :create, :update]
    end
  end

end
