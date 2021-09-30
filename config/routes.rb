Rails.application.routes.draw do
  resources :weights, only: [:create, :show, :update, :destroy]
  resources :cats, only: [:create, :show, :index, :update, :destroy]
  resources :users, only: [:show, :update]

  # custom route to manage new user
  post '/signup', to: 'users#create'
  get "/me", to: "users#show"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # calculator routes
  post '/catcalculator', to: 'cats#bcscalculator'

end
