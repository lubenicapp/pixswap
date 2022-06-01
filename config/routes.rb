# frozen_string_literal: true

Rails.application.routes.draw do
  root 'puzzles#index'

  resources :puzzles
  post '/puzzles/:id/move', to: 'puzzles#move'

  #
  # show next puzzle to solve
  #
  get '/challenge', to: 'puzzles#challenge'

  #
  # reset all progression
  #
  post '/reset', to: 'puzzles#reset'
end
