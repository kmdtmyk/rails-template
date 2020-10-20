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

  resource :profile, only: [:edit, :update]
  resources :notices, only: [:index]

  namespace :settings do
    resources :users, except: [:show]
    resources :notices, except: [:show]
  end

  namespace :api do
    namespace :web do
      resources :items, only: [:index]
    end

    namespace :v1 do
      resource :login, only: [:create]
      resource :user, only: [], module: :user do
        resource :password, only: [:update]
      end
    end
  end

end
