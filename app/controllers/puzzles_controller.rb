# frozen_string_literal: true

class PuzzlesController < ApplicationController
  before_action :find_puzzle, only: [:show, :move, :reset_one]

  # GET /puzzles
  def index
    @puzzles = Puzzle.all
  end

  # GET /puzzles/:id
  def show
    @puzzle
  end

  # POST /puzzles/:id/move
  def move
    valid_move = @puzzle&.move(params)
    if valid_move
      @puzzle.save
    else
      redirect_to puzzle_path, status: :unprocessable_entity
    end
  end

  # GET /challenge
  def challenge
    puzzle = Puzzle.where("status == 'unsolved'").first
    redirect_to controller: 'puzzles', action: 'show', id: puzzle&.id
  end

  # POST /puzzles/reset
  def reset_all
    puzzles = Puzzle.all
    puzzles.each(&:reset)
    redirect_to root_url
  end

  # POST /puzzles/:id/reset
  def reset_one
    @puzzle&.reset
    redirect_to controller: 'puzzles', action: 'show', id: @puzzle&.id
  end

  private

  def find_puzzle
    @puzzle = Puzzle.find_by_id params[:id]
  end
end
