# frozen_string_literal: true

class PuzzlesController < ApplicationController
  include RackSessionFix
  before_action :find_puzzle, only: [:show, :move, :reset_one]
  before_action :authenticate_user!, only: [:challenge, :move, :reset_one, :reset_all]
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
    @puzzle&.move(params)
    @puzzle.save
  rescue IllegalMoveException
    head :unprocessable_entity
  end

  # GET /challenge
  def challenge
    @puzzle = Puzzle.where("status = 'unsolved'").first
  end

  # POST /puzzles/reset
  def reset_all
    puzzles = Puzzle.all
    puzzles.each(&:reset)
    head 204
  end

  # POST /puzzles/:id/reset
  def reset_one
    @puzzle&.reset
    head 204
  end

  private

  def find_puzzle
    @puzzle = Puzzle.find params[:id]
  end
end
