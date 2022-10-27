Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tweets
  resources :users, only: [:show]
end
