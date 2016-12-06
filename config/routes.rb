Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'
  resources :users, only: [:index]
  post '/users/search_by', to: 'users#search_by'
  get '/users/new', to: 'admin/users#new'
  get '/workshops/new', to: 'admin/workshops#new'

  authenticate :user do
    resources :users, only: [:show]
    resources :skills, only: [:edit, :destroy]
  end

  namespace :admin  do
    resources :users, only: [:show, :edit, :update]
    resources :workshops, only: [:new, :create]
  end

  resources :workshops, except: [:new, :create] do
    resources :skills, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update]
  end
end
