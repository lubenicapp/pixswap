# frozen_string_literal: true

Rails.application.routes.draw do
  root 'puzzles#index'

  resources :puzzles, only: [:index, :show]
  post '/puzzles/:id/move', to: 'puzzles#move'

  #
  # show next puzzle to solve
  #
  get '/challenge', to: 'puzzles#challenge'

  #
  # reset all progression
  #
  post 'puzzles/reset', to: 'puzzles#reset_all'
  post 'puzzles/:id/reset', to: 'puzzles#reset_one'
end
