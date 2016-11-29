Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#index'
  resources :users, except: [:destroy]
  resources :workshops
  resources :skills

  delete 'skill/:id/destroy', to: 'skills#destroy', as: 'destroy_skill'
end
