Rails.application.routes.draw do
  resources :users
  resources :items
  resources :orders
  resources :subcategories
  resources :categories
  resources :application
  get 'current-user', to: 'users#current_user'
  get '/users/:id/items', to: 'users#get_user_items'
  get '/categories/:id/subcategories', to: 'categories#get_subcategories'
  post 'authenticate', to: 'authentication#authenticate'
end