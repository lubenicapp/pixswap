# frozen_string_literal: true

class PuzzlesController < ApplicationController

  before_action :find_puzzle, only: [:show, :destroy, :move, :reset_one]

  def index
    @puzzles = Puzzle.all
  end

  def create; end

  def show
    @puzzle
  end

  def destroy
    @puzzle&.destroy
  end

  # rescue_from

  def move
    valid_move = @puzzle&.move(params)
    if valid_move
      @puzzle.save
    else
      redirect_to puzzle_path, status: :unprocessable_entity
    end
  end

  def challenge
    puzzle = Puzzle.where("status == 'unsolved'").first
    redirect_to controller: 'puzzles', action: 'show', id: puzzle&.id
  end

  def reset_all
    puzzles = Puzzle.all
    puzzles.each(&:reset)
    redirect_to root_url
  end

  def reset_one
    @puzzle&.reset
    redirect_to controller: 'puzzles', action: 'show', id: @puzzle&.id
  end

  private

  def find_puzzle
    @puzzle = Puzzle.find_by_id params[:id]
  end
end
