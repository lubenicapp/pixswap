Rails.application.routes.draw do

  root 'puzzles#index'

  resources :puzzles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
