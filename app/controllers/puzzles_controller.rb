class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def create
  end

  def show
    @puzzle = Puzzle.find_by_id([params[:id]])
  end

end
