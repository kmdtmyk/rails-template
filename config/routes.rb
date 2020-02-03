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

  resource :user, only: [:edit, :update]
  resources :notices, only: [:index]
  resources :orders, except: [:show]
  resources :books, except: [:show]

  get '/example', to: 'example#show'

  namespace :settings do
    resources :users, except: [:show]
    resources :notices, except: [:show]
    resources :items, except: [:show]
  end

  namespace :autocomplete do
    resources :items, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resource :login, only: [:create]
      resource :user, only: [], module: :user do
        resource :password, only: [:update]
      end
      resources :books, only: [:index, :show, :create, :update]
    end
  end

end
