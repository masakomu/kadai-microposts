Rails.application.routes.draw do
  get 'favorites/create'

  get 'favorites/destroy'

  get 'relationships/create'

  get 'relationships/destroy'

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'signup', to: 'users#new'
  resources :users, only: [:index, :new, :create, :show] do
    member do
      get :followings
      get :followers
    end
    member do
      get :likings
    end
  end

  resources :microposts, only: [:index, :create, :destroy, :show]

  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

end