Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  get '/menu', to: 'groups#index', as: 'menu'
  get '/user/:user_id/home', to: 'users#show', as: 'user'
  get '/categories/new', to: 'groups#new'
  post '/categories', to: 'groups#create', as: 'groups'

  get '/user/:user_id/transactions/:group_id', to: 'exchanges#show'
  get '/transactions/new/:group_id', to: 'exchanges#new'
  post '/transactions/:group_id', to: 'exchanges#create', as: 'exchanges'
end
