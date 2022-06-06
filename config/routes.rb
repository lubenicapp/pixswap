# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'puzzles#index'

  resources :puzzles, only: [:index, :show] do
    member do
      post '/move', to: "puzzles#move"
      post '/reset', to: "puzzles#reset_one"
    end
    collection do
      post "/reset", to: "puzzles#reset_all"
    end
  end

  get '/challenge', to: 'puzzles#challenge'

  post '/sign_in', to: 'tokens#sign_in'
  post '/token_sign_in', to: 'tokens#token_sign_in'
  post '/sign_out', to: 'tokens#sign_out'
end
