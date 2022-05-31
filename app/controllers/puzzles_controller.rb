class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def create
  end
end
