Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'
resources :users, only: [:index]
post '/users/search_by', to: 'users#search_by'

  authenticate :user do
    resources :users, only: [:show]
    resources :skills, only: [:edit, :destroy]

    namespace :admin  do
      resources :users
      resources :workshops
      resources :skills
    end

    resources :workshops do
      resources :skills, only: [:new, :create, :edit, :update, :destroy]
      resources :users, only: [:show, :edit, :update]
    end
  end
end
