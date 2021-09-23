Rails.application.routes.draw do
  resources :weights
  resources :cats
  resources :users

  # custom route to manage new user
  post '/signup', to: 'users#create'
  get "/me", to: "users#show"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
