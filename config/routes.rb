Rails.application.routes.draw do
  devise_for :users
 
  root 'items#index'
  resources :items do
    resources :purchases
  end
  # post '/items/new', to: 'items#create'
end
