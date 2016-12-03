Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'

  resources :users, only: [:index, :show, :edit, :update]

  namespace :admin  do
    resources :users
    resources :workshops
    resources :skills
  end

  resources :workshops, except: [:new, :create] do
    resources :skills, only: [:index, :new, :create, :edit, :destroy]
    resources :users, only: [:edit]
  end

  resources :skills, only: [:edit, :update]

  post '/users/search_by', to: 'users#search_by'
  delete '/skills/:id/destroy', to: 'skills#destroy', as: 'destroy_skill'
end
