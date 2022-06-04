# frozen_string_literal: true

Rails.application.routes.draw do
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

end
