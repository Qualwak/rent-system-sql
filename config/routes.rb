Rails.application.routes.draw do
  resources :users
  resources :items
  resources :orders
  resources :subcategories
  resources :categories
  post 'authenticate', to: 'authentication#authenticate'
  resources :application
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end