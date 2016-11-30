Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'application#index'
  resources :users, except: [:destroy] do
    resources :workshops, only: [:show, :index]
  end
  resources :workshops do
    resources :skills, only: [:index, :new, :edit, :destroy]
  end
  resources :skills

  post '/users/search_by', to: 'users#search_by'
  delete '/skills/:id/destroy', to: 'skills#destroy', as: 'destroy_skill'
end
