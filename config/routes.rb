Rails.application.routes.draw do
  devise_for :users
 
  root 'items#index'
  resources :users
  resources :items

  resources :articles

  # post '/items/new', to: 'items#create'
end
