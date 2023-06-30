Rails.application.routes.draw do
  devise_for :users
 
  root 'items#index'
  resources :items

  # post '/items/new', to: 'items#create'
end
